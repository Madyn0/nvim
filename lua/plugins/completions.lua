return { {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "onsails/lspkind.nvim",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Color
            vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg='#c4a7e7' })
            vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })

            cmp.setup({
                formatting = {
                    format = lspkind.cmp_format(),
                    -- format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-y>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
                }),
                vim.keymap.set({ "i" }, "<C-K>", function()
                    luasnip.expand()
                end, { silent = true }),
                vim.keymap.set({ "i", "s" }, "<C-L>", function()
                    luasnip.jump(1)
                end, { silent = true }),
                vim.keymap.set({ "i", "s" }, "<C-J>", function()
                    luasnip.jump(-1)
                end, { silent = true }),

                vim.keymap.set({ "i", "s" }, "<C-E>", function()
                    if luasnip.choice_active() then
                        luasnip.change_choice(1)
                    end
                end, { silent = true }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
