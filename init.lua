pcall(function() vim.loader.enable() end)

require("config.options")
require("config.keymaps")
require("config.lazy")

vim.cmd('colorscheme madyn')
