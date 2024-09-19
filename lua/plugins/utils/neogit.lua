return {
	"NeogitOrg/neogit",

	config = function()
		local neogit = require("neogit")
		neogit.setup({})
		vim.keymap.set("n", "<leader>ng", ": Neogit <cr>")
		vim.keymap.set("n", "<leader>ngc", ": Neogit commit <cr>")
		vim.keymap.set("n", "<leader>ngb", ": Neogit branch <cr>")
		vim.keymap.set("n", "<leader>ngp", ": Neogit push <cr>")
	end,
}
