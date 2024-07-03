return {
	"NeogitOrg/neogit",

	config = function()
		local neogit = require("neogit")
		neogit.setup({})
		vim.keymap.set("n", "<leader>ng", ": Neogit <cr>")
		vim.keymap.set("n", "<leader>ngc", ": Neogit commit <cr>")
	end,
}
