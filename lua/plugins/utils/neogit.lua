return {
	"NeogitOrg/neogit",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},

	opts = {},
	-- event = "VeryLazy",
	lazy = false,

	keys = {
		{ "<leader>ng", "<cmd> Neogit <cr>" },
		{ "<leader>ngc", "<cmd> Neogit commit <cr>" },
		{ "<leader>ngb", "<cmd> Neogit branch <cr>" },
		{ "<leader>ngp", "<cmd> Neogit push <cr>" },
	},

	config = function()
		require("diffview").setup({
			view = {
				merge_tool = {
					layout = "diff3_mixed",
				},
			},
		})
	end,
}
