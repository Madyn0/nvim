return {
  "nvim-neotest/neotest",

  dependencies = {
    "nvim-neotest/nvim-nio",
    "olimorris/neotest-rspec",
    "antoinemadec/FixCursorHold.nvim",
  },

  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec"),
      },
    })

    local map = vim.keymap.set

    map("n", "<leader>tn", function()
      require("neotest").run.run()
    end)
    map("n", "<leader>tf", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end)
    map("n", "<leader>tl", function()
      require("neotest").run.run_last()
    end)
    map("n", "<leader>ts", function()
      require("neotest").summary.toggle()
    end)
    map("n", "<leader>to", function()
      require("neotest").output.open()
    end)
    map("n", "<leader>ty", function()
      require("neotest").output_panel.toggle()
    end)
  end,
}
