local map = vim.keymap.set

-- netrw
map("n", "<leader>d", "<cmd>Explore<cr>")

-- Move line up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in same position when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Center screen when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Copy to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Exit insert mode with CTRL-c
map("i", "<C-c>", "<Esc>")
map("n", "Q", "<nop>")

-- Replace the word under the cursor
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("n", "<leader>h", "<cmd>split<cr>")
map("n", "<leader>v", "<cmd>vsplit<cr>")
