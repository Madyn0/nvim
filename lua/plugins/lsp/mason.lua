return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"solargraph",
					"pyright",
				},
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		config = function()
			require("mason-tool-installer").setup({

				ensure_installed = {
					"prettier",
					"stylua",
					"isort",
					"black",
					"pylint",
					"rubocop",
					"hyprls",
					"erb-lint",
					"erb-formatter",
					"eslint",
					"htmlbeautifier",
					"shfmt",
					"stylelint",
				},
			})
		end,
	},
}
