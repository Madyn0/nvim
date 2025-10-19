return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  event = { "BufReadPre", "BufNewFile" },

  opts = function()
    vim.diagnostic.config({
      virtual_text = false,
      underline = { severity = { min = vim.diagnostic.severity.WARN } },
      signs = true,
      float = { border = "rounded", source = "if_many" },
      severity_sort = true,
      update_in_insert = false,
    })

    local function on_attach(_, bufnr)
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      local function map(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
      end

      map("n", "gd", vim.lsp.buf.definition)
      map("n", "gD", vim.lsp.buf.declaration)
      map("n", "gi", vim.lsp.buf.implementation)
      map("n", "gr", vim.lsp.buf.references)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "<C-k>", vim.lsp.buf.signature_help)
      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "]d", vim.diagnostic.goto_next)
      map("n", "[d", vim.diagnostic.goto_prev)
      map("n", "<leader>e", vim.diagnostic.open_float)
      map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)
      map("n", "<space>tt", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
      end)
      map("n", "<leader>tv", function()
        local cfg = not vim.diagnostic.config().virtual_lines
        vim.diagnostic.config({ virtual_lines = cfg })
      end)
    end

    local get_caps = require("blink.cmp").get_lsp_capabilities
    local base = { on_attach = on_attach, capabilities = get_caps() }

    vim.lsp.config.clangd = vim.tbl_deep_extend("force", base, {
    })

    vim.lsp.config.lua_ls = vim.tbl_deep_extend("force", base, {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          diagnostics = { globals = { "vim" } },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.config.rubocop = vim.tbl_deep_extend("force", base, {
      cmd = { "bundle", "exec", "rubocop", "--lsp" },
      filetypes = { "ruby" },
      cmd_cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":h") .. "/.rubocop-bundle",
      single_file_support = true,
    })

    vim.lsp.config.ruby_lsp = vim.tbl_deep_extend("force", base, {})

    vim.lsp.config.rust_analyzer = vim.tbl_deep_extend("force", base, {})

    return {
      enable = {
        "clangd",
        "lua_ls",
        "rubocop",
        "ruby_lsp",
        "rust_analyzer",
      },
    }
  end,

  config = function(_, opts)
    vim.lsp.enable(opts.enable or {})
  end,
}
