return {
	"nvimtools/none-ls.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.diagnostics.stylelint,
				null_ls.builtins.diagnostics.erb_lint.with({
          command = "erb_lint",
					args = {
						"--stdin",
						"$FILENAME",
						"--format",
						"json",
						"--config",
						"/home/madyn/dots/.config/.erb-lint.yml",
					},
					stdin = true,
					filetypes = { "eruby" },
				}),
				null_ls.builtins.diagnostics.pylint.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.code = diagnostic.message_id
					end,
				}),
			},
		})

		-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
