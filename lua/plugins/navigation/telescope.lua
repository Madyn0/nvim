return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',

    config = function()
        require('telescope').load_extension('fzf')
        require("telescope").load_extension("rails")
        require("telescope").load_extension("ui-select")

        local builtin = require('telescope.builtin')

        -- File navigation
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader><Space>', builtin.current_buffer_fuzzy_find, {})

        -- Rails navigation
        vim.keymap.set("n", "<leader>rs", "<cmd>Telescope rails specs<CR>")
        vim.keymap.set("n", "<leader>rc", "<cmd>Telescope rails controllers<CR>")
        vim.keymap.set("n", "<leader>rm", "<cmd>Telescope rails models<CR>")
        vim.keymap.set("n", "<leader>rv", "<cmd>Telescope rails views<CR>")
        vim.keymap.set("n", "<leader>ri", "<cmd>Telescope rails migrations<CR>")
        vim.keymap.set("n", "<leader>rl", "<cmd>Telescope rails libs<CR>")
        vim.api.nvim_set_keymap('n', '<leader>rl',
            ':lua require("telescope.builtin").find_files({ prompt_title = "< Rails Libs >", cwd = vim.fn.getcwd() .. "/app/lib", hidden = true })<CR>',
            { noremap = true, silent = true })

        -- Help
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        -- For fun
        vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})

        -- Need to sort out what I need here
        vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
        vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
        vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, {})
        vim.keymap.set('n', '<leader>fdd', builtin.lsp_definitions, {})
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
        vim.keymap.set('n', '<leader>fqq', builtin.quickfixhistory, {})
    end
}
