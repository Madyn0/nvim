return {
  {
    "neovim/nvim-lspconfig",

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.enable("rubocop")
      vim.lsp.config.rubocop = {
        cmd = {
          "bundle",
          "exec",
          "rubocop",
          "--lsp",
        },
        -- cmd_cwd = vim.fn.getcwd() .. "/.rubocop-bundle",
        cmd_cwd = "/home/madyn/code/plentify/.rubocop-bundle",
      }

      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }

      vim.diagnostic.config({
        virtual_text = {
          spacing = 2,
          prefix = "",
          source = "if_many",
        },
        signs = true,
        underline = false,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local opts = { buffer = ev.buf, silent = true }
          local set = vim.keymap.set

          -- Keybindings for LSP
          set("n", "gD", vim.lsp.buf.declaration, opts)
          set("n", "gd", vim.lsp.buf.definition, opts)
          set("n", "gi", vim.lsp.buf.implementation, opts)
          set("n", "<space>D", vim.lsp.buf.type_definition, opts)
          set("n", "gr", vim.lsp.buf.references, opts)
          set("n", "K", vim.lsp.buf.hover, opts)
          set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          set("n", "<space>rn", vim.lsp.buf.rename, opts)
          set("n", "<space>d", vim.diagnostic.open_float, opts)
          set("n", "<space>ca", vim.lsp.buf.code_action, opts)
          if vim.bo[ev.buf].filetype == "ruby" and client.supports_method("textDocument/formatting") then
            set("n", "<space>f", function()
              vim.lsp.buf.format({ async = true })
            end, vim.tbl_extend("force", opts, { desc = "Format Ruby via LSP" }))
          end
        end,
      })
    end,
  },

  {
    "mason-org/mason.nvim",

    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",

    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ruby_lsp",
        },
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "isort",
          "black",
          "pylint",
          "hyprls",
          "erb-lint",
          "erb-formatter",
          "eslint",
          "htmlbeautifier",
          "shfmt",
          "stylelint",
        },
      })
    end,
  },
}
