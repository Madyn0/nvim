local set = vim.keymap.set

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Brings up `netrw` in the current directory
set("n", "<leader>f<space>", vim.cmd.Ex)

-- Move line up/down in visual mode
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Join line below to current line & keep cursor same position
set("n", "J", "mzJ`z")

-- Keep cursor in same position when scrolling
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- Center screen when searching
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Paste over current selection & keep deleted text in register
set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

-- Exit insert mode with CTRL-c
set("i", "<C-c>", "<Esc>")
set("n", "Q", "<nop>")

-- Replace the word under the cursor
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Make navigation between splits easier
set("n", "<M-j>", "<c-w><c-j>")
set("n", "<M-k>", "<c-w><c-k>")
set("n", "<M-l>", "<c-w><c-l>")
set("n", "<M-h>", "<c-w><c-h>")

-- Control the size of splits
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-<lt>", "<C-W>+")
set("n", "<M->gt>", "<C-W>-")
