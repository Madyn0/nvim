return {
	"sindrets/diffview.nvim",

	config = function()
		vim.keymap.set("n", "<leader>df", ": DiffviewFileHistory % <cr>")
		vim.keymap.set("n", "<leader>dfa", ": DiffviewFileHistory <cr>")
		vim.keymap.set("n", "<leader>dft", ": DiffviewToggleFiles <cr>")
		vim.keymap.set("n", "<leader>dfc", ": DiffviewClose <cr>")
	end,
}
