return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	lazy = false,
	config = function()
		require("rose-pine").setup({
			variant = "main",
			dark_variant = "main",
			disable_background = true,
			disable_float_background = true,
		})
		-- vim.cmd.colorscheme "rose-pine"
	end,
}
