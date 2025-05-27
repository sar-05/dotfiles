return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({})
      opts = {
        servers = {
          lua_ls = {},
          pyright = {},
          marksman = {},
          bashls = {},
          taplo = {},
          hyprls = {}
        }
      }
      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end
  }
}
