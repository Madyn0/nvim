-- THIS IS WHERE WE GET ALL THE PACKAGES FROM THEIR RESPECTIVE FILES --

return {
    -- Looks
    require("plugins.looks.noice"),
    require("plugins.looks.notify"),
    require("plugins.looks.nvim_web_devicons"),
    -- require("plugins.looks.netrw"),

    -- Navigation
    require("plugins.navigation.harpoon"),
    require("plugins.navigation.telescope"),
    require("plugins.navigation.telescope_fzf"),
    require("plugins.navigation.telescope_rails"),
    require("plugins.navigation.telescope_ui_select"),

    -- Colorschemes
    require("plugins.colorschemes.rose-pine"),
    require("plugins.colorschemes.catppuccin"),
    require("plugins.colorschemes.tokyonight"),
    require("plugins.colorschemes.onedark"),

    -- Utilities
    require("plugins.utils.copilot"),
    require("plugins.utils.markdownpreview"),

    -- LSP
    require("plugins.lsp.treesitter"),
    require("plugins.lsp.mason"),
    require("plugins.lsp.lspconfig"),

    -- Meh
    require("plugins.meh.undotree"),

}
