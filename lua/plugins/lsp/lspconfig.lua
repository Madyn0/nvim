return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local lsp = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local set = vim.keymap.set
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				-- Keybindings for LSP
				opts.desc = "Go to Declaration"
				set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Go to Definition"
				set("n", "gd", vim.lsp.buf.definition, opts)

				opts.desc = "Go to Implementation"
				set("n", "gi", vim.lsp.buf.implementation, opts)

				opts.desc = "Go to Type Definition"
				set("n", "<space>D", vim.lsp.buf.type_definition, opts)

				opts.desc = "Go to References"
				set("n", "gr", vim.lsp.buf.references, opts)

				opts.desc = "Hover"
				set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Show Signature Help"
				set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

				opts.desc = "Rename"
				set("n", "<space>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show line diagnostics"
				set("n", "<space>d", vim.diagnostic.open_float)

				opts.desc = "Show code actions"
				set("n", "<space>ca", vim.lsp.buf.code_action, opts)
			end,
		})

		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				prefix = "",
				source = "if_many",
			},
			signs = true,
			underline = false,
			update_in_insert = false,
			severity_sort = true,
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				lsp[server_name].setup({
					capabilities = capabilities,
				})
			end,
		})

		-- For Hyprland config files
		lsp.hyprls.setup({
			capabilities = capabilities,
		})
	end,
}
