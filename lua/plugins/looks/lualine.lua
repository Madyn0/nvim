return {
        'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup {
            -- options = {
            --     theme = 'iceberg_dark'
            -- }

            require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {{'filename',path = 1,},'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {{'filename',path = 1,},'progress'},
    lualine_z = {}
  },
}
        }
    end
}
