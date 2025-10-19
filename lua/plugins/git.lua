return {
  {
    "lewis6991/gitsigns.nvim",

    event = "BufRead",

    opts = {
      update_debounce = 200,
    },

    keys = {
      { "<leader>hp",  "<cmd>Gitsigns preview_hunk<CR>" },
      { "<leader>hb",  '<cmd>lua require"gitsigns".blame_line{full=true}<CR>' },
      { "<leader>gst", "<cmd>Gitsigns toggle_current_line_blame<CR>" },
      { "<leader>hd",  "<cmd>Gitsigns diffthis ~<CR>" },
      { "<leader>gb",  "<cmd>Gitsigns blame<CR>" },
    },
  },
  {
    "NeogitOrg/neogit",

    cmd = { "Neogit" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    opts = {
      disable_hint = true,
      disable_builtin_notifications = true,
      graph_style = "unicode",
    },

    keys = {
      { "<leader>ng", "<cmd>Neogit<CR>" },
    },
  },
}
