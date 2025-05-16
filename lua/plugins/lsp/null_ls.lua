return {
  "nvimtools/none-ls.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.pylint.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.code = diagnostic.message_id
          end,
        }),
      },
    })
  end,
}
