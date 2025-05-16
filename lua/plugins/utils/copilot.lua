return {
  "github/copilot.vim",

  event = "BufEnter",

  keys = {
    { "<C-]>", "<Plug>(copilot-next)", mode = "i" },
    { "<C-[>", "<Plug>(copilot-previous)", mode = "i" },
    { "<C-L>", "<Plug>(copilot-accept-word)", mode = "i" },
  },
}
