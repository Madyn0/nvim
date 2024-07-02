local opt = vim.opt

-- Get block cursor in all modes
opt.guicursor = ""

-- Remove banner for netrw
vim.cmd("let g:netrw_banner = 0")

-- Get relative line numbers
opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

-- Highlight current line (maybe keep)
-- opt.cursorline = true

opt.wrap = false

-- For `undo`
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- For `search`
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

