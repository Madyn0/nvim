return {
    "neovim/nvim-lspconfig",

    config = function()
        local lsp = require("lspconfig")

        -- For Ruby on Rails
        lsp.solargraph.setup {}

        -- For Lua
        lsp.lua_ls.setup {}

        -- For Python
        lsp.pyright.setup {}

        -- For Hyprland config files
        lsp.hyprls.setup {}
    end

}
