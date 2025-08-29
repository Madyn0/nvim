return {
  "thoughtbot/vim-rspec",

  ft = { "ruby" },
  dependencies = { "akinsho/toggleterm.nvim" },

  keys = function()
    local function rspec_cmd(scope)
      local file = vim.fn.expand("%")
      if scope == "nearest" then
        return ("bundle exec rspec %s:%d"):format(file, vim.fn.line("."))
      elseif scope == "file" then
        return ("bundle exec rspec %s"):format(file)
      elseif scope == "last" then
        return vim.g._last_rspec_cmd or "bundle exec rspec"
      else
        return "bundle exec rspec"
      end
    end

    -- single persistent floating terminal
    local rspec_term
    local function term()
      if rspec_term and (rspec_term:is_open() or rspec_term.job_id) then
        return rspec_term
      end
      local Terminal = require("toggleterm.terminal").Terminal
      rspec_term = Terminal:new({
        direction = "float",
        close_on_exit = false,
        hidden = true,
        float_opts = { border = "rounded" },
        on_open = function(t)
          vim.keymap.set("t", "q", function()
            local win = vim.api.nvim_get_current_win()
            if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
          end, { buffer = t.bufnr, nowait = true, silent = true })
        end,
      })
      return rspec_term
    end

    local function run(scope)
      pcall(function() require("toggleterm").setup({}) end)
      local cmd = rspec_cmd(scope)
      vim.g._last_rspec_cmd = cmd
      local t = term()
      t:open()
      t:send(cmd .. "\r")
    end

    return {
      { "<leader>tn", function() run("nearest") end },
      { "<leader>tf", function() run("file") end },
      { "<leader>ts", function() run("suite") end },
      { "<leader>tl", function() run("last") end },
    }
  end,
}
