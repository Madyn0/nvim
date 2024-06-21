return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "c",
                "lua",
                "c_sharp",
                "cpp",
                "make",
                "python",
                "ruby",
                "css",
                "html",
                "javascript",
                "json",
                "yaml",
                "bash",
                "go",
                "rust",
                "rasi",
                "toml",
                "hyprlang",
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            vim.filetype.add({
                pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
            }),
            vim.filetype.add({
                pattern = { [".*/rofi/.*%.rasi"] = "rasi" },
            }),
        })
    end,
}
