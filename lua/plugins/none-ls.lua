return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.formatting.erb_format,
				null_ls.builtins.diagnostics.cmake_lint,
				null_ls.builtins.diagnostics.checkmake,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.diagnostics.pylint.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.code = diagnostic.message_id
					end,
				}),
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
			},
		})
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
