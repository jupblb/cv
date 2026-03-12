function Span(el)
  if el.classes:includes("date") then
    return {
      pandoc.RawInline("latex", "\\hfill "),
      pandoc.Str(pandoc.utils.stringify(el)),
    }
  end
end

function HorizontalRule()
  return {
    pandoc.RawBlock("latex", "\\vspace*{\\fill}"),
    pandoc.HorizontalRule(),
  }
end

function Header(el)
  if el.level == 1 and PANDOC_DOCUMENT.meta["combined"] then
    local input = PANDOC_STATE.input_files[1]
    local name = input:match("([^/]+)%.md$")
    if name then
      local label = (#name <= 3) and name:upper()
        or name:sub(1, 1):upper() .. name:sub(2)
      el.content:insert(pandoc.Space())
      el.content:insert(pandoc.Str("(" .. label .. ")"))
    end
  end
  return el
end

function Pandoc(doc)
  local meta = doc.meta
  local parts = {}

  if meta.email then
    local addr = pandoc.utils.stringify(meta.email)
    table.insert(parts, string.format(
      "\\faIcon{envelope} \\href{mailto:%s}{%s}", addr, addr))
  end
  if meta.phone then
    local phone = pandoc.utils.stringify(meta.phone)
    table.insert(parts, "\\faIcon{phone} " .. phone)
  end
  if meta.linkedin then
    local li = pandoc.utils.stringify(meta.linkedin)
    table.insert(parts, string.format(
      "\\faIcon{linkedin} \\href{https://www.linkedin.com/in/%s/}{%s}", li, li))
  end
  if meta.github then
    local gh = pandoc.utils.stringify(meta.github)
    table.insert(parts, string.format(
      "\\faIcon{github} \\href{https://github.com/%s}{%s}", gh, gh))
  end

  if #parts == 0 then return nil end

  local latex = "\\vspace{-0.5em}\n\\begin{center}\n\\small\n"
    .. table.concat(parts, " \\quad\n") .. "\n\\normalsize\n\\end{center}"
  local contact = pandoc.RawBlock("latex", latex)

  local blocks = pandoc.List()
  for _, b in ipairs(doc.blocks) do
    blocks:insert(b)
    if b.t == "Header" and b.level == 1 then
      blocks:insert(contact)
    end
  end

  return pandoc.Pandoc(blocks, meta)
end
