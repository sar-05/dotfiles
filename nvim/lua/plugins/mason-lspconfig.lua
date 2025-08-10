return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "pyright",
      "taplo",
      "marksman",
      "hyprls",
      "bashls",
      "texlab",
      "jsonls",
      "systemd_ls",
      "powershell_es"
    }
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
