#!/usr/bin/env python3
"""Check that a resume PDF is exactly one page and report space utilization."""

import json
import re
import sys

import fitz

# Approximate line height in points for body text (11pt font + leading).
LINE_HEIGHT_PT = 15.0


def estimate_lines(height_pt: float) -> int:
    return max(0, round(height_pt / LINE_HEIGHT_PT))


def find_body_font_size(page_dict: dict) -> float:
    """Find the most common font size on the page (i.e., body text size)."""
    from collections import Counter
    sizes = Counter()
    for b in page_dict["blocks"]:
        if b["type"] != 0:
            continue
        for l in b["lines"]:
            for s in l["spans"]:
                sizes[round(s["size"], 1)] += 1
    return sizes.most_common(1)[0][0] if sizes else 0


def check_pdf(path: str) -> dict:
    doc = fitz.open(path)
    pages = len(doc)
    page = doc[0]
    blocks = page.get_text("blocks")

    if not blocks:
        return {"path": path, "pages": pages, "status": "error",
                "message": "No text content found on page 1"}

    w, h = page.rect.width, page.rect.height

    # Infer margins from content bounding box on page 1.
    left_margin = min(b[0] for b in blocks)
    right_margin = w - max(b[2] for b in blocks)
    top_margin = min(b[1] for b in blocks)
    available_width = w - left_margin - right_margin

    page_dict = page.get_text("dict")
    body_size = find_body_font_size(page_dict)

    result = {"path": path, "pages": pages}

    # --- Page count -----------------------------------------------------------
    if pages > 1:
        last_page = doc[pages - 1]
        last_blocks = last_page.get_text("blocks")
        if last_blocks:
            overflow_bottom = max(b[3] for b in last_blocks)
            overflow_top = min(b[1] for b in last_blocks)
            overflow_height = overflow_bottom - overflow_top
        else:
            overflow_height = 0
        result["status"] = "overflow"
        result["lines_to_cut"] = estimate_lines(overflow_height)
        result["message"] = (
            f"Resume is {pages} pages. Cut ~{result['lines_to_cut']} lines "
            f"of content to fit on a single page."
        )
        return result

    # --- Vertical space -------------------------------------------------------
    max_y = max(b[3] for b in blocks)
    bottom_margin = h - max_y
    remaining_pt = bottom_margin - top_margin  # space before hitting margin
    remaining_lines = estimate_lines(remaining_pt)

    result["remaining_lines"] = remaining_lines
    if remaining_lines <= 2:
        result["vertical"] = "good"
    else:
        result["vertical"] = "underfill"

    # --- Horizontal utilization -----------------------------------------------
    # Check what fraction of the available width each text block uses.
    # Ignore very small blocks (headers, dates) — focus on body content.
    min_body_height = LINE_HEIGHT_PT * 1.5  # block must be at least ~1.5 lines
    narrow_blocks = 0
    body_blocks = 0
    for b in blocks:
        block_w = b[2] - b[0]
        block_h = b[3] - b[1]
        if block_h < min_body_height:
            continue
        body_blocks += 1
        fill_ratio = block_w / available_width
        if fill_ratio < 0.7:
            narrow_blocks += 1

    if body_blocks > 0:
        narrow_pct = narrow_blocks / body_blocks * 100
        result["narrow_blocks_pct"] = round(narrow_pct, 0)
        if narrow_pct > 40:
            result["horizontal"] = "narrow"
        else:
            result["horizontal"] = "good"
    else:
        result["horizontal"] = "good"
        result["narrow_blocks_pct"] = 0

    # --- Short lines ----------------------------------------------------------
    # Detect body text lines that use less than 60% of available width.
    # This catches both standalone single-line blocks and short trailing lines
    # in multi-line blocks (e.g., a paragraph whose last line is very short).
    # Excluded: headers (non-body font size), dates, and bullet markers.
    short_lines = []
    for b in page_dict["blocks"]:
        if b["type"] != 0:
            continue
        for line in b["lines"]:
            spans = [s for s in line["spans"]
                     if round(s["size"], 1) == body_size]
            if not spans:
                continue
            text = "".join(s["text"] for s in spans).strip()
            # Skip dates, bullet markers, and very short fragments.
            if not text or len(text) < 10:
                continue
            # Skip lines that are predominantly bold (headers, job titles,
            # dates) — these are structurally short by design.
            bold_chars = sum(len(s["text"]) for s in spans
                            if "Bold" in s["font"] or "bold" in s["font"])
            total_chars = sum(len(s["text"]) for s in spans)
            if total_chars > 0 and bold_chars / total_chars > 0.5:
                continue
            # Skip date spans (e.g., "04.2021-04.2023").
            if re.fullmatch(r"[\d.]+-[\w.]+", text):
                continue
            lx0 = min(s["bbox"][0] for s in spans)
            lx1 = max(s["bbox"][2] for s in spans)
            ratio = (lx1 - lx0) / available_width
            if ratio < 0.6:
                short_lines.append(text)

    result["short_lines"] = short_lines

    # --- Overall status -------------------------------------------------------
    issues = []
    if result["vertical"] == "underfill":
        issues.append(
            f"~{remaining_lines} lines of vertical space remaining"
        )
    if result["horizontal"] == "narrow":
        issues.append(
            f"{result['narrow_blocks_pct']:.0f}% of body text blocks "
            f"are narrow (use less than 70% of available width)"
        )
    if short_lines:
        issues.append(
            f"{len(short_lines)} single-line text block(s) use less than "
            f"60% of available width"
        )

    if issues:
        result["status"] = "underfill"
        result["message"] = (
            "Resume has unused space: " + "; ".join(issues) + ". "
            "Expand content with more relevant details from cv.md."
        )
    else:
        result["status"] = "good"
        result["message"] = "Resume fits well on a single page."

    return result


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <pdf_path>", file=sys.stderr)
        sys.exit(1)

    result = check_pdf(sys.argv[1])
    print(json.dumps(result, indent=2))
    sys.exit(0 if result["status"] == "good" else 1)
