return {
    "github/copilot.vim",
    config = function()
        vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)")
        vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)")
        vim.keymap.set("i", "<C-[>", "<Plug>(copilot-previous)")
    end,
}
