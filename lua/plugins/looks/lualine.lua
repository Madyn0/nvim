return {
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	event = "VeryLazy",

	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
		},

		sections = {
			lualine_a = { "mode" },
			lualine_b = { { "filename", path = 1 }, "progress" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = { "branch", "diff", "diagnostics" },
			lualine_z = { "location" },
		},

		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = { "location" },
			lualine_y = { { "filename", path = 1 }, "progress" },
			lualine_z = {},
		},
	},
}
