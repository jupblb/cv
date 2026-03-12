---
description: Generates a tailored single-page resume (resume.md) for a specific
  company and role. Use when asked to generate, create, or tailor a resume for a
  job application.
name: generating-resume
---

# Generating Resume

Generate a tailored single-page resume from `cv.md` for a specific company and
role.

## Workflow

### Step 1: Research the company and role

Use `web_search` and `read_web_page` to gather information about:

-   The company's products, mission, and engineering culture
-   The specific role requirements, tech stack, and responsibilities
-   What the company values in candidates

### Step 2: Read the full CV

Read `cv.md` to understand all available experience, projects, and skills.

### Step 3: Generate resume.md

Create `resume.md` by selecting and adapting content from `cv.md`:

-   Keep the same YAML frontmatter format as `cv.md`
-   Keep the same Markdown structure: H1 for name, H2 for sections, H3 for
    positions
-   Use the same `[date]{.date}` syntax for dates
-   Use the same reference link style for URLs
-   Keep the contact info metadata (email, phone, linkedin, github)
-   Do NOT include a Summary section
-   Select only the most relevant positions from Experience
-   For each selected position, pick only the most relevant details and
    achievements for this specific role
-   In the Technologies section, prioritize technologies relevant to the job
    offer. If space remains, add other major/well-known technologies (e.g.,
    prefer Python over Puppet)
-   Include only relevant Education entries
-   Do NOT invent or fabricate any information --- only use what exists in
    `cv.md`, rephrased or condensed as needed

### Step 4: Build and verify the PDF

Run the following command to build the PDF:

``` sh
pandoc -H style.tex --lua-filter=filter.lua -o resume.pdf resume.md
```

Then run the check script to verify page count and space utilization:

``` sh
python3 .agents/skills/generating-resume/scripts/check_pdf.py resume.pdf
```

The script outputs JSON with:

-   `status`: `"good"` \| `"overflow"` \| `"underfill"`
-   `message`: human-readable explanation of the result
-   When `"overflow"`: `lines_to_cut` --- approximate number of lines to remove
-   When single page: `remaining_lines` --- approximate lines of vertical space
    left
-   `narrow_blocks_pct` --- percentage of body text blocks using less than 70%
    of available width
-   `short_lines` --- list of single-line body text blocks using less than 60%
    of available width

### Step 5: Iterate until perfect

If the check script reports a status other than `"good"`, adjust `resume.md`:

-   **`overflow`**: Remove less relevant content, condense descriptions, shorten
    bullet points. Use `lines_to_cut` to gauge how much to remove.
-   **`underfill` (vertical)**: Add more relevant details from `cv.md`, expand
    bullet points, include more positions. Use `remaining_lines` to gauge how
    much to add.
-   **`underfill` (narrow content)**: Expand terse bullet points into fuller
    descriptions that use the available width. Turn short fragments into
    complete sentences with more detail.
-   **`underfill` (short lines)**: The `short_lines` list shows the exact text
    of lines in the rendered PDF (not the markdown source) that are too narrow.
    Find the corresponding content in `resume.md` and expand or merge it so the
    rendered line fills more of the page width.

After each edit, rebuild and re-check. Repeat until `status` is `"good"`.

### Important constraints

-   The resume MUST use the same style as `cv.md`: same `style.tex`, same
    `filter.lua`, same `geometry` margin, same `fontsize`. Do NOT change margins
    or font size to fit content.
-   Only adjust the content itself to achieve a well-filled single page.
