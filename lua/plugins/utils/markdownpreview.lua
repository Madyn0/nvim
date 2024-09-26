return {
	"iamcco/markdown-preview.nvim",

	ft = { "markdown" },
	build = "cd app && yarn install",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },

	keys = {
		{ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>" },
	},
}
