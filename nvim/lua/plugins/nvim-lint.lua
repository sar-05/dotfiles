return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  config = function()
    local lint = require("lint")
    -- Set linters per filetype
    lint.linters_by_ft = {
      markdown = { "markdownlint-cli2" }
    }
    -- Try linting on when entering and saving a buffer and when leaving insert mode
    local lintaugroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lintaugroup,
      callback = function()
        lint.try_lint()
      end
    })
    -- Keymap to manually call linting
    vim.keymap.set('n', '<leader>ll', function() lint.try_lint() end)
  end,
  -- keys = {
  --   {
  --     "<leader>ll",
  --     function()
  --       require("lint").try_lint()
  --     end,
  --     desc = "Trigger linting for current file"
  --   }
  -- }
}
