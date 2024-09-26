return {
	"ThePrimeagen/harpoon",

	event = "BufEnter",
	branch = "harpoon2",

	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

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

		-- Keybindings

		vim.keymap.set("n", "<leader>e", function()
			toggle_telescope(harpoon:list())
		end)

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), {
        height = 12, -- Set the height (Need to make adjustments in the local source code, for this to work here)
				ui_fallback_width = 80, -- Set the fallback width
				ui_width_ratio = 0.9, -- Set the width ratio
				ui_max_width = 78, -- Set the maximum width
				border = "double", -- Set the border style ("single", "double", "rounded", etc.)
				title = "My Harpoon Marks", -- Set a custom title
				title_pos = "center", -- Position the title ("left", "center", "right")
			})
		end)
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end)
	end,
}
