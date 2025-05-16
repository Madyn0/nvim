return {
  "lewis6991/gitsigns.nvim",

  opts = {},
  event = "BufRead",

  keys = {
    { "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>" },
    { "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>' },
    { "<leader>gst", "<cmd>Gitsigns toggle_current_line_blame<CR>" },
    { "<leader>hd", "<cmd>Gitsigns diffthis ~<CR>" },
  },
}
