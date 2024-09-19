return {
	"NeogitOrg/neogit",

	dependencies = { "nvim-lua/plenary.nvim" },

	lazy = true,
	opts = {},

	keys = {
		{ "<leader>ng", "<cmd> Neogit <cr>" },
		{ "<leader>ngc", "<cmd> Neogit commit <cr>" },
		{ "<leader>ngb", "<cmd> Neogit branch <cr>" },
		{ "<leader>ngp", "<cmd> Neogit push <cr>" },
	},
}
