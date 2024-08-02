return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"Madyn0/rails-finder.nvim",
	},

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
		{ "<leader><Space>", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
		{ "<leader>fc", "<cmd>Telescope colorscheme<cr>" },
	},

	config = function()
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("rails")

		local builtin = require("telescope.builtin")

		-- Need to sort out what I need here
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
		vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, {})
		vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, {})
		vim.keymap.set("n", "<leader>fdd", builtin.lsp_definitions, {})
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, {})
		vim.keymap.set("n", "<leader>fqq", builtin.quickfixhistory, {})
	end,
}
