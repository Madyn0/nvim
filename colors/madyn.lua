vim.opt.termguicolors = true
vim.o.background      = "dark"
vim.g.colors_name     = "madyn"

-- Palette (used for syntax & diagnostics)
local bg              = "#101214"
local fg              = "#E8E8E8"
local comment         = "#94A3B8"
local string          = "#34D399"
-- local keyword = "#C084FC"
local keyword         = "#A493FF"
local func            = "#93C5FD"
local typec           = "#5EEAD4"
local number          = "#FBBF24"
local const           = "#F472B6"
-- local const   = "#F4978E"
local oper            = "#E5E7EB"
local dE              = "#FCA5A5"
local dW              = "#FDE68A"
local dI              = "#93C5FD"
local dH              = "#67E8F9"

-- Neutral UI tones
local gutter          = "#2B2F36"
local border          = "#2A2C31"
local cursorline      = "#161A20"
local selection       = "#223049"
local float_bg        = "#14161B"
local pmenu_bg        = "#151920"
local match_bg        = "#2F2B1A"
local linenr_fg       = "#9EABB7"

local hi              = function(g, t) vim.api.nvim_set_hl(0, g, t) end

-- ===== Core text & UI =====
hi("Normal", { fg = fg, bg = bg })
hi("NormalNC", { fg = fg, bg = bg })
hi("NonText", { fg = gutter })
hi("Whitespace", { fg = gutter })
hi("LineNr", { fg = linenr_fg, bg = bg })
hi("SignColumn", { bg = bg })
hi("CursorLine", { bg = cursorline })
hi("CursorLineNr", { fg = "#CFD6DD", bold = true })
hi("Visual", { bg = selection })
hi("Search", { fg = fg, bg = "#3B3B12" })
hi("IncSearch", { fg = fg, bg = "#5A5A18", bold = true })
hi("MatchParen", { bg = match_bg, bold = true })
hi("WinSeparator", { fg = border })
hi("VertSplit", { fg = border })
hi("FoldColumn", { fg = linenr_fg, bg = bg })
hi("Folded", { fg = comment, bg = "#17181C" })

-- ===== Menus / floats / statusline =====
hi("Pmenu", { fg = fg, bg = pmenu_bg })
hi("PmenuSel", { fg = bg, bg = func, bold = true })
hi("PmenuSbar", { bg = "#20232A" })
hi("PmenuThumb", { bg = "#2E333D" })
hi("NormalFloat", { fg = fg, bg = float_bg })
hi("FloatBorder", { fg = border, bg = float_bg })
hi("StatusLine", { fg = fg, bg = "#16181D" })
hi("StatusLineNC", { fg = comment, bg = "#121419" })

-- ===== Selective syntax =====
-- Color only the essentials; keep the rest neutral to avoid "confetti".
hi("Comment", { fg = comment })
hi("String", { fg = string })
hi("Keyword", { fg = keyword })
hi("Function", { fg = func })
hi("Type", { fg = typec })
hi("Constant", { fg = const })
hi("Number", { fg = number })
hi("Operator", { fg = oper })

-- Everything else stays neutral (body color)
local neutral = { fg = fg }
for _, g in ipairs({ "Identifier", "Delimiter", "PreProc", "Statement", "Special", "Title" }) do
  hi(g, neutral)
end
hi("Todo", { fg = "#EEEEEE", bg = "#2A2A16", bold = true })

-- ===== Diagnostics: readable, calm =====
hi("DiagnosticError", { fg = dE })
hi("DiagnosticWarn", { fg = dW })
hi("DiagnosticInfo", { fg = dI })
hi("DiagnosticHint", { fg = dH })
hi("DiagnosticUnderlineError", { undercurl = true, sp = dE })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = dW })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = dI })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = dH })

-- Subtle virtual text backgrounds
hi("DiagnosticVirtualTextError", { fg = dE, bg = "#2A1718" })
hi("DiagnosticVirtualTextWarn", { fg = dW, bg = "#2A2214" })
hi("DiagnosticVirtualTextInfo", { fg = dI, bg = "#161D2A" })
hi("DiagnosticVirtualTextHint", { fg = dH, bg = "#142226" })

-- ===== Diffs / git signs =====
hi("DiffAdd", { bg = "#13251A" })
hi("DiffChange", { bg = "#132033" })
hi("DiffDelete", { bg = "#2A1416" })
hi("DiffText", { bg = "#1C2A44", bold = true })
hi("GitSignsAdd", { fg = "#34D399" })
hi("GitSignsChange", { fg = "#93C5FD" })
hi("GitSignsDelete", { fg = "#FCA5A5" })

-- ===== Treesitter / LSP =====
hi("@string", { link = "String" })
hi("@keyword", { link = "Keyword" })
hi("@function", { link = "Function" })
hi("@function.call", { link = "Function" })
hi("@type", { link = "Type" })
hi("@constant", { link = "Constant" })
hi("@number", { link = "Number" })
hi("@operator", { link = "Operator" })
hi("@keyword", { link = "Keyword" })
hi("@keyword.return", { link = "Keyword" })
hi("@keyword.function", { link = "Keyword" })
hi("@keyword.operator", { link = "Keyword" })

-- Keep most structural tokens neutral for calmness
for _, g in ipairs({
  "@variable", "@parameter", "@property", "@field", "@punctuation",
  "@lsp.type.variable", "@lsp.type.parameter", "@lsp.type.property"
}) do hi(g, neutral) end

hi("@lsp.type.function", { link = "Function" })
hi("@lsp.type.type", { link = "Type" })
hi("@lsp.typemod.variable.readonly", { link = "Constant" })

-- ===== Telescope =====
hi("TelescopeTitle", { fg = keyword, bold = true })
hi("TelescopeBorder", { fg = border, bg = bg })
hi("TelescopePromptNormal", { fg = fg, bg = pmenu_bg })
hi("TelescopePromptBorder", { fg = border, bg = pmenu_bg })
hi("TelescopeResultsNormal", { fg = fg, bg = bg })
hi("TelescopePreviewNormal", { fg = fg, bg = bg })
hi("TelescopeSelection", { bg = selection })
hi("TelescopeMatching", { fg = func, bold = true })

-- ===== Treesitter =====
local link = function(from, to) vim.api.nvim_set_hl(0, from, { link = to }) end
local neutral = { fg = fg }

-- Core mappings
link("@comment", "Comment")
link("@string", "String")
link("@number", "Number")
link("@float", "Number")
link("@boolean", "Constant")
link("@constant", "Constant")
link("@type", "Type")
link("@function", "Function")
link("@function.call", "Function")
link("@operator", "Operator")
link("@keyword", "Keyword")
link("@keyword.function", "Keyword")
link("@keyword.return", "Keyword")
link("@keyword.operator", "Keyword")

-- Strings/details
hi("@string.escape", { fg = oper, bold = true })
link("@string.regex", "Constant")
link("@string.special", "Constant")

-- Builtins / constructors
link("@constant.builtin", "Constant")
link("@function.builtin", "Function")
link("@type.builtin", "Type")
link("@constructor", "Type")

-- Variables/params/properties kept calm
for _, g in ipairs({
  "@variable", "@variable.parameter", "@variable.member", "@property",
  "@field", "@attribute", "@namespace", "@module", "@punctuation", "@punctuation.bracket",
  "@punctuation.delimiter", "@symbol"
}) do hi(g, neutral) end

-- Some structural punctuation reads better as operators
link("@punctuation.special", "Operator")

-- ===== LSP semantic tokens =====
link("@lsp.type.namespace", "Type")
link("@lsp.type.type", "Type")
link("@lsp.type.class", "Type")
link("@lsp.type.enum", "Type")
link("@lsp.type.interface", "Type")
link("@lsp.type.struct", "Type")
link("@lsp.type.typeParameter", "Type")

link("@lsp.type.function", "Function")
link("@lsp.type.method", "Function")
link("@lsp.type.macro", "Function")

link("@lsp.type.enumMember", "Constant")
link("@lsp.type.constant", "Constant")
link("@lsp.typemod.variable.readonly", "Constant")

-- Keep variables/params neutral for calm body text
for _, g in ipairs({
  "@lsp.type.variable", "@lsp.type.parameter", "@lsp.type.property", "@lsp.type.field"
}) do hi(g, neutral) end

-- ===== Legacy Tree-sitter groups =====
link("TSComment", "Comment")
link("TSString", "String")
link("TSNumber", "Number")
link("TSFloat", "Number")
link("TSBoolean", "Constant")
link("TSConstant", "Constant")
link("TSType", "Type")
link("TSFunction", "Function")
link("TSMethod", "Function")
link("TSOperator", "Operator")
link("TSKeyword", "Keyword")
link("TSConstructor", "Type")
link("TSPunctSpecial", "Operator")

-- ===== Markdown/markup =====
link("@markup.heading", "Title")
link("@markup.italic", "Italic")
link("@markup.bold", "Bold")
link("@markup.link.url", "Underlined")
link("@markup.link", "Constant")
link("@markup.list", "Operator")
