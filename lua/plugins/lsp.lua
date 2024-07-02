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
					"html",
					"jsonls",
					"pyright",
					"rust_analyzer",
					"solargraph",
					"rubocop",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local border = {
				{ "🭽", "FloatBorder" },
				{ "▔", "FloatBorder" },
				{ "🭾", "FloatBorder" },
				{ "▕", "FloatBorder" },
				{ "🭿", "FloatBorder" },
				{ "▁", "FloatBorder" },
				{ "🭼", "FloatBorder" },
				{ "▏", "FloatBorder" },
			}

			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			-- To instead override globally
			-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			-- 	opts = opts or {}
			-- 	opts.border = opts.border or border
			-- 	return orig_util_open_floating_preview(contents, syntax, opts, ...)
			-- end

			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			local lspconfig = require("lspconfig")

			-- Gutter signs
			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			vim.diagnostic.config({
				virtual_text = {
					spacing = 4,
					prefix = "",
					source = "if_many",
					-- source = "always",
				},
				signs = true,
				underline = false,
				update_in_insert = false,
				severity_sort = true,
			})

			-- Display diagnostics floating window with cursot hover
			-- vim.o.updatetime = 250
			-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			--     group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
			--     callback = function()
			--         vim.diagnostic.open_float(nil, { focus = false })
			--     end,
			-- })

			lspconfig.lua_ls.setup({
				handlers = handlers,
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
			lspconfig.hyprls.setup({
				capabilities = capabilities,
				hint = { enabled = true },
				cmd = { "hyprls", "--stdio" },
				filetypes = { "*.hl", "hypr*.conf", ".config/hypr/*.conf" },
			})
			-- lspconfig.rubocop.setup({
			-- 	capabilities = capabilities,
			-- 	handlers = handlers,
			-- })
			lspconfig.solargraph.setup({
				capabilities = capabilities,
				handlers = handlers,
				hint = { enabled = true },
				settings = {
					solargraph = {
						diagnostics = false,
						completion = true,
						folding = false,
						formatting = false,
						hover = true,
						references = true,
						rename = true,
						symbols = true,
						typecheck = true,
						autoformat = false,
						highlight = true,
						definitions = true,
					},
				},
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
			lspconfig.stylelint_lsp.setup({
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

			-- Hyprlang LSP
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
				pattern = { "*.hl", "hypr*.conf" },
				callback = function(event)
					vim.lsp.start({
						name = "hyprlang",
						cmd = { "hyprls" },
						root_dir = vim.fn.getcwd(),
					})
				end,
			})

			-- Removes the underline from diagnostics
			-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
			-- 	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			-- 		underline = false,
			-- 		update_in_insert = false,
			-- 		virtual_text = {
			-- 			spacing = 4,
			-- 			prefix = "",
			-- 			source = "if_many",
			-- 			-- source = "always",
			-- 		},
			-- 		severity_sort = true,
			-- 		-- signs = true,
			-- 	})

			-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			--     border = "rounded",
			-- })
			--
			-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			--     border = "rounded",
			-- })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					if vim.lsp.inlay_hint then
						vim.keymap.set("n", "<leader>ih", function()
							vim.lsp.inlay_hint.enable(true)
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
