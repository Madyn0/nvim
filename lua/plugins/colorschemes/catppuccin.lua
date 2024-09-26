return {
	"catppuccin/nvim",

	enabled = false,

	name = "catppuccin",
	priority = 1000,

	opts = {
		flavour = "mocha",
		transparent_background = true,
		show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
		no_italic = true,
		no_underline = true,
	},
	-- vim.cmd.colorscheme("catppuccin")
}
