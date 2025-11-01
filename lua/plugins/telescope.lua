return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  lazy = false,

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release",
    },
    { dir = "~/code/rails-finder.nvim" },
  },

  opts = {
    defaults = {
      sorting_strategy = "ascending",
      prompt_prefix = "  ",
      selection_caret = "❯ ",
      entry_prefix = "  ",
      layout_strategy = 'vertical',

      hidden = true,
      follow = true,
      no_ignore = true,

      file_ignore_patterns = {
        "^node_modules/",
        "^vendor/",
        "^app/assets/images",
        "^tmp/",
        "^log/",
      },

      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--trim",
        "--hidden",
        "--glob", "!**/.git/*",
        "--glob", "!node_modules/",
        "--glob", "!vendor/",
      },
    },
    pickers = {
      find_files = { theme = "dropdown", previewer = false, hidden = true },
      live_grep = { theme = "ivy" },
      current_buffer_fuzzy_find = { theme = "ivy" },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  },

  keys = {
    { "<C-p>",           function() require("telescope.builtin").find_files() end },
    { "<leader>rg",      function() require("telescope.builtin").live_grep() end },
    { "<leader>ht",      function() require("telescope.builtin").help_tags() end },
    { "<leader>mp",      function() require("telescope.builtin").man_pages() end },
    { "<leader><space>", function() require("telescope.builtin").current_buffer_fuzzy_find() end },
    { "<leader>fc",      function() require("telescope.builtin").colorscheme() end },
  },

  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("rails")
  end,
}
