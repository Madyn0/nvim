-- THIS IS WHERE WE GET ALL THE PACKAGES FROM THEIR RESPECTIVE FILES --

return {
	-- Looks
	require("plugins.looks.noice"),
	require("plugins.looks.netrw"),
	require("plugins.looks.notify"),
	-- require("plugins.looks.lualine"),

	-- Navigation
	require("plugins.navigation.harpoon"),
	require("plugins.navigation.telescope"),

	-- Colorschemes
	require("plugins.colorschemes.rose-pine"),
	-- require("plugins.colorschemes.catppuccin"),
	-- require("plugins.colorschemes.tokyonight"),

	-- Utilities
  require("plugins.utils.neogit"),
  require("plugins.utils.neotest"),
	require("plugins.utils.copilot"),
	require("plugins.utils.gitsigns"),
 --  require("plugins.utils.markdownpreview"),

	-- LSP
  require("plugins.lsp.lsp"),
  require("plugins.lsp.null_ls"),
	require("plugins.lsp.formatting"),
  require("plugins.lsp.treesitter"),
  require("plugins.lsp.completions"),

	-- Meh
  require("plugins.meh.comment"),
	require("plugins.meh.undotree"),
	-- require("plugins.meh.autopairs"),
}
