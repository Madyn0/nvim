return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",

  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    require("harpoon").setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    })

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    local map = vim.keymap.set

    map("n", "<leader>e", function()
      toggle_telescope(harpoon:list())
    end)
    map("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list(), {
        height_in_lines = 12,
        ui_fallback_width = 80,
        ui_width_ratio = 0.9,
        ui_max_width = 88,
        border = "double",
        title = "Stare Into The Maggot Draw",
        title_pos = "center",
      })
    end)
    map("n", "<leader>a", function()
      harpoon:list():add()
    end)
    map("n", "<C-h>", function()
      harpoon:list():select(1)
    end)
    map("n", "<C-n>", function()
      harpoon:list():select(2)
    end)
    map("n", "<C-t>", function()
      harpoon:list():select(3)
    end)
    map("n", "<C-s>", function()
      harpoon:list():select(4)
    end)
  end,
}
