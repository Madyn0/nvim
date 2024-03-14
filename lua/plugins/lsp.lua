return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "cssls",
                    "eslint",
                    "html",
                    "jsonls",
                    "tsserver",
                    "autotools_ls",
                    "pyright",
                    "rust_analyzer",
                    "solargraph",
                    "rubocop",
                    "tailwindcss",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })
            lspconfig.rubocop.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })
            lspconfig.solargraph.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })
            lspconfig.autotools_ls.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })
            lspconfig.eslint.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })
            lspconfig.ccls.setup({
                capabilities = capabilities,
                hint = { enabled = true },
            })

            on_attach = function(client, bufnr)
                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(bufnr, true)
                end
            end

            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

            -- Removes the underline from diagnostics
            vim.lsp.handlers["textDocument/publishDiagnostics"] =
                vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    underline = false,
                })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    if vim.lsp.inlay_hint then
                        vim.keymap.set("n", "<leader>uh", function()
                            vim.lsp.inlay_hint.enable(0, true)
                        end, { desc = "Toggle inlay hints" })
                    end

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    -- vim.keymap.set('n', '<space>f', function()
                    --     vim.lsp.buf.format { async = true }
                    -- end, opts)
                end,
            })
        end,
    },
}
