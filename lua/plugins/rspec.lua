return {
  "klen/nvim-test",

  dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },

  keys = {
    { "<leader>tn", "<cmd>TestNearest<CR>", desc = "Test nearest" },
    { "<leader>tf", "<cmd>TestFile<CR>",    desc = "Test file" },
    { "<leader>ts", "<cmd>TestSuite<CR>",   desc = "Test suite" },
    { "<leader>tl", "<cmd>TestLast<CR>",    desc = "Test last" },
    { "<leader>tv", "<cmd>TestVisit<CR>",   desc = "Test visit" },
  },

  config = function()
    require("toggleterm").setup({})

    require("nvim-test").setup({
      term = "toggleterm",
      termOpts = {
        direction = "float",
        close_on_exit = false,
      },
      runners = { ruby = "nvim-test.runners.rspec" },
    })

    require("nvim-test.runners.rspec"):setup({
      command = "rspec",
      args = { "--format", "documentation" },
    })
  end,
}
