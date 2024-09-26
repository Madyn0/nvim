return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.8",
	cmd = "Telescope",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"Madyn0/rails-finder.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
		{ "<leader><Space>", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
		{ "<leader>fc", "<cmd>Telescope colorscheme<cr>" },

		{ "<leader>fr", "<cmd>Telescope lsp_references<cr>" },
		{ "<leader>fi", "<cmd>Telescope lsp_implementations<cr>" },
		{ "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<cr>" },
		{ "<leader>fdd", "<cmd>Telescope lsp_definitions<cr>" },
		{ "<leader>fd", "<cmd>Telescope diagnostics<cr>" },
		{ "<leader>fq", "<cmd>Telescope quickfix<cr>" },
		{ "<leader>fqq", "<cmd>Telescope quickfixhistory<cr>" },
	},

	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "flex",
				layout_config = {
					width = 0.9,
					height = 0.9,
					prompt_position = "top",
					preview_cutoff = 120,
					horizontal = { width = { padding = 0.1 } },
					vertical = { width = { padding = 0.05 }, height = { padding = 0.1 } },
				},

				sorting_strategy = "ascending",

				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-d>"] = require("telescope.actions").results_scrolling_down,
            ["<C-u>"] = require("telescope.actions").results_scrolling_up,
					},
				},
			},

			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},

				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		local telescope = require("telescope")

		telescope.load_extension("fzf")
		telescope.load_extension("rails")
		telescope.load_extension("ui-select")
	end,
}
