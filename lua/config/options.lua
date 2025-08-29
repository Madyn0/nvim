local o, wo, g = vim.o, vim.wo, vim.g

g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

for _, p in ipairs({
"gzip","zip","zipPlugin","tar","tarPlugin","getscript","getscriptPlugin",
"vimball","vimballPlugin","2html_plugin","logipat","rrhelper","tutor_mode_plugin",
"matchit",
}) do g["loaded_"..p] = 1 end


o.backup = false
o.swapfile = false
o.undofile = true
o.updatetime = 200
o.timeoutlen = 350
o.ttimeoutlen = 10

o.mouse = ""
o.guicursor = ""

o.winblend = 0
o.pumblend = 0
o.winborder = 'rounded'
o.lazyredraw = true

wo.number, wo.relativenumber = true, true
o.colorcolumn = "80"
o.signcolumn = "yes"
o.splitright, o.splitbelow = true, true
o.scrolloff, o.sidescrolloff = 6, 6
o.wrap = false

o.expandtab = true
o.shiftwidth, o.tabstop = 2, 2

o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = false
o.inccommand = "split"

g.mapleader = " "
