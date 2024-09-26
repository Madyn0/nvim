return {
	"stevearc/conform.nvim",

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				ruby = { "rubocop" },
				lua = { "stylua" },
				erb = { "erb_format", "htmlbeautifier" },
				eruby = { "erb_format", "htmlbeautifier" },
				python = { "isort", "black" },
				javascript = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
			options = {
				prettier = { args = { "--tab-width", "2" } },
			},
		})
	end,

	-- Keybind to format
	vim.api.nvim_set_keymap(
		"n",
		"<space>f",
		'<cmd>lua require("conform").format()<CR>',
		{ noremap = true, silent = true }
	),
}
