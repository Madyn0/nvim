local opt = vim.opt

local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Get block cursor in all modes
opt.guicursor = ""

-- Remove banner for netrw
vim.cmd("let g:netrw_banner = 0")

-- Set conceall level
vim.opt.conceallevel = 1

-- Get relative line numbers
opt.nu = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

-- Highlight current line (Trying it out)
opt.cursorline = true

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

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})
