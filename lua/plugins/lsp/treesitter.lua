return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({

            ensure_installed = {
                "bash",
                "css",
                "csv",
                "diff",
                "git_config",
                "git_rebase",
                "gitcommit",
                "gitignore",
                "html",
                "hyprlang",
                "javascript",
                "json",
                "lua",
                "luadoc",
                "luap",
                "make",
                "markdown",
                "markdown_inline",
                "proto",
                "python",
                "query",
                "rasi",
                "regex",
                "ruby",
                "scss",
                "ssh_config",
                "toml",
                "tsx",
                "vue",
                "xml",
                "yaml",
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
            })
        })
    end,
}
