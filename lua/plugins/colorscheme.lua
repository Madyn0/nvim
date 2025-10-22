return {
  {
    "projekt0n/github-nvim-theme",

    name = "github-theme",
    lazy = false,
    priority = 1000,

    config = function()
      -- vim.cmd("colorscheme github_dark_high_contrast")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",

    config = function()
      require("rose-pine").setup({
        variant = "auto",      -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true,        -- Handle deprecated options automatically
        },

        styles = {
          bold = false,
          italic = false,
          transparency = true,
        },
      })

      -- vim.cmd("colorscheme rose-pine")
      -- vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
    end,
  },
  {
    "Mofiqul/vscode.nvim",

    config = function()
      require('vscode').setup({
        -- Alternatively set style in setup
        style = 'dark',

        -- Enable transparent background
        transparent = true,

        -- Enable italic comment
        italic_comments = true,

        -- Enable italic inlay type hints
        italic_inlayhints = true,

        -- Underline `@markup.link.*` variants
        underline_links = true,
      })
    end,
    -- load the theme without affecting devicon colors.
    -- vim.cmd.colorscheme "vscode"
  },
}
