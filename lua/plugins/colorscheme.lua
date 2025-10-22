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
  }
}
