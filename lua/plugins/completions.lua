return {
  "Saghen/blink.cmp",

  version = "*",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "L3MON4D3/LuaSnip",             version = "*", build = "make install_jsregexp" },
    { "rafamadriz/friendly-snippets", lazy = true },
  },

  opts = {
    signature = { enabled = true },
    appearance = { use_nvim_cmp_as_default = true },
    sources = { default = { "lsp", "snippets" } },
    keymap = {
      preset = "default",

      ["<C-Space>"] = { "accept" },
      ["<C-f>"] = { "scroll_documentation_up" },
      ["<C-b>"] = { "scroll_documentation_down" },
      ["<C-y>"] = { "show_documentation" },
    },
    completion = {
      documentation = {
        auto_show = false,
        window = { max_width = 84 }
      },
    },
    fuzzy = {
      implementation = 'rust',
      max_typos = function(keyword) return math.floor(#keyword / 4) end,
      use_frecency = true,
      use_proximity = true,
      prebuilt_binaries = {
        download = true,
      },
    },
  },
}
