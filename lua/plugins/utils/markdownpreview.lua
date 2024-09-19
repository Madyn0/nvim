return {
	"iamcco/markdown-preview.nvim",

	ft = { "markdown" },
	build = "cd app && yarn install",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },

	config = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>")
	end,
}
