return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({

      ensure_installed = {
        "html",
        "hyprlang",
        "javascript",
        "json",
        "lua",
        "rasi",
        "ruby",
        "rust",
      },

      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
