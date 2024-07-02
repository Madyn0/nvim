return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			-- "nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",

			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup({})
		vim.keymap.set("n", "<leader>ng", ": Neogit <cr>")
		vim.keymap.set("n", "<leader>ngc", ": Neogit commit <cr>")
		end,
	},
}
