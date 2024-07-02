return {
    {
        {
            "stevearc/dressing.nvim",
            config = function()
                require("dressing").setup({
                    input = {
                        enabled = true,
                    },
                    select = {
                        enabled = true,
                        backend = "telescope",
                        telescope = {
                            theme = "dropdown",
                            layout_config = {
                                prompt_position = "bottom",
                            },
                        },
                    },
                })
            end,
        },
    },
    {
        "weizheheng/ror.nvim",
        config = function()
            vim.keymap.set("n", "<Leader>hc", ":lua require('ror.commands').list_commands()<CR>", { silent = true })
        end,
    },
}
