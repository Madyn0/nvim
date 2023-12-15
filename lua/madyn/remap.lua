vim.g.mapleader = " "
vim.keymap.set("n", "<leader>f<space>", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- These two lines will move the line up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Allowing you to move multiple lines at once into lets say a function

vim.keymap.set("n", "J", "mzJ`z")            -- This will join the line below to the current line and keep the cursor in the same position

vim.keymap.set("n", "<C-d>", "<C-d>zz")      -- Thes two lines will keep the cursor in the same position when scrolling
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv") -- These two lines will center the screen when searching
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])       -- This will paste over the current selection and keep deleted words in the register

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- This line will copy to the system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])        -- This line will copy to the system clipboard

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]]) -- This line will delete to the black hole register

vim.keymap.set("i", "<C-c>", "<Esc>")            -- This line will allow you to exit insert mode with ctrl-c

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format) -- This line will format the current buffer

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")     -- These two lines will allow you to go to the next and previous quickfix errors
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- This line will allow you to replace the word under the cursor
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })              --
