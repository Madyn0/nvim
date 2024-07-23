return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",

	config = function()
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		local builtin = require("telescope.builtin")

		-- File navigation
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader><Space>", builtin.current_buffer_fuzzy_find, {})

		-- Rails navigation
		vim.api.nvim_set_keymap(
			"n",
			"<leader>rt",
			':lua require("telescope.builtin").find_files({ prompt_title = "< Rails Tests >", cwd = vim.fn.getcwd() .. "/spec", hidden = true })<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>rc",
			':lua require("telescope.builtin").find_files({ prompt_title = "< Rails Controllers >", cwd = vim.fn.getcwd() .. "/app/controllers", hidden = true })<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>rm",
			':lua require("telescope.builtin").find_files({ prompt_title = "< Rails Models >", cwd = vim.fn.getcwd() .. "/app/models", hidden = true })<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>rv",
			':lua require("telescope.builtin").find_files({ prompt_title = "< Rails Views >", cwd = vim.fn.getcwd() .. "/app/views", hidden = true })<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ri",
			':lua require("telescope.builtin").find_files({ prompt_title = "< Rails Migrations >", cwd = vim.fn.getcwd() .. "/db/migrate", hidden = true })<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>rl",
			':lua require("telescope.builtin").find_files({ prompt_title = "< Rails Libs >", cwd = vim.fn.getcwd() .. "/app/lib", hidden = true })<CR>',
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>rj",
			':lua require("telescope.builtin").find_files({ prompt_title = "< Rails Jobs >", cwd = vim.fn.getcwd() .. "/app/jobs", hidden = true })<CR>',
			{ noremap = true, silent = true }
		)

		-- Help
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

		-- For fun
		vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {})

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
