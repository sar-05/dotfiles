return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile"
  },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      markdown = { "markdownlint-cli2" }
    }
    local lintaugroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lintaugroup,
      callback = function()
        lint.try_lint()
      end
    })
  end,
  keys = {
    {
      "<leader>ll",
      function()
        require("lint").try_lint()
      end,
      desc = "Trigger linting for current file"
    }
  }
}
