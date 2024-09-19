return {
	"lewis6991/gitsigns.nvim",

	opts = {},
	keys = {
		{ "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>" },
		{ "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>' },
		{ "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>" },
	},
}
