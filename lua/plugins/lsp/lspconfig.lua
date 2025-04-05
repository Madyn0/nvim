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
				set("n", "gD", vim.lsp.buf.declaration, opts)
				set("n", "gd", vim.lsp.buf.definition, opts)
				set("n", "gi", vim.lsp.buf.implementation, opts)
				set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				set("n", "gr", vim.lsp.buf.references, opts)
				set("n", "K", vim.lsp.buf.hover, opts)
				set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				set("n", "<space>rn", vim.lsp.buf.rename, opts)
				set("n", "<space>d", vim.diagnostic.open_float, opts)
				set("n", "<space>ca", vim.lsp.buf.code_action, opts)
        -- set("n", "<space>f", vim.lsp.buf.format, opts)
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

		lsp.rubocop.setup({
			capabilities = capabilities,
      -- init_options = {
      --   configFile = "/home/madyn/dots/.config/rubocop/config.yml",
      -- },
      -- settings = {
      --   rubocop = {
      --     configFile = vim.fn.expand("/home/madyn/dots/.config/rubocop/config.yml"),
      --   }
      -- }
		})

		lsp.ruby_lsp.setup({
			capabilities = capabilities,
		})

		lsp.clangd.setup({
			capabilities = capabilities,
		})

		-- lsp.solargraph.setup({
		-- 	capabilities = capabilities,
		-- })

    lsp.html.setup({
      capabilities = capabilities,
      filetypes = { "html", "eruby", "erb" },
      init_options = {
        configurationSection = { "html", "css", "javascript", "erb", "eruby" },
        embeddedLanguages = {
          css = true,
          javascript = true,
          erb = true,
          eruby = true,
        },
      },
    })
	end,
}
