-- Probably move this somewhere better later
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local opt = vim.opt

------------------------
----- Tab & Indent -----
------------------------
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

-- opt.smartindent = true
-- opt.autoindent = true

------------------------
----- Line Numbers -----
------------------------
opt.number = true
opt.relativenumber = true

-----------------------
----- Cursor & UI -----
-----------------------
opt.guicursor = ""
-- opt.cursorline = true -- Because I'm blind
opt.conceallevel = 1
vim.cmd("let g:netrw_banner = 0")

-----------------------------------
----- Miscellaneous UI Tweaks -----
-----------------------------------
opt.wrap = false
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "80"

------------------
----- Search -----
------------------
opt.smartcase = true
opt.ignorecase = true

-- Must have!
opt.inccommand = "split"

------------------
----- Splits -----
------------------
opt.splitbelow = true
opt.splitright = true

----------------
----- Undo -----
----------------
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.backup = false
opt.swapfile = false

-----------------------
---- Miscellaneous ----
-----------------------
opt.updatetime = 50 -- Might be placebo
opt.more = false

opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

---------------------------
----- Quality of Life -----
---------------------------
opt.formatoptions:remove("o")

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
