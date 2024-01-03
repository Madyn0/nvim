return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,
                terminal_colors = true,
                styles = {
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
        end,
    },
}
