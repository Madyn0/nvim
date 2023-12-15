
return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
local config = require("nvim-treesitter.configs")
config.setup({
	 ensure_installed = {  "c", "lua", "vim", "vimdoc", "query", "javascript", "bash", "c_sharp", "cpp", "csv", "css", "doxygen", "html", "http", "json", "make", "markdown_inline", "python", "sql", "typescript" },
          sync_install = false,
	  auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },  
        })
	end
}
