return {
	"folke/noice.nvim",

	dependencies = {
		"MunifTanjim/nui.nvim",
	},

	event = { "CmdlineEnter", "BufRead" },

	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},

		presets = {
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	},
}
