return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'lua_ls', 'hyprls', 'pyright', 'bashls','marksman', 'taplo', 'texlab'
        }
      })
      Opts = {
        servers = {
          lua_ls = {},
          pyright = {},
          marksman = {},
          bashls = {},
          taplo = {},
          hyprls = {},
          texlab = {
            -- Disable TexLab's lsp functionality since we'll use vimtex
            build = {
              onSave = false,
              executable = "latexmk",
              args = {"-pdf", "-interaction=nonstopmode", "-synctex=1", "%f"},
            },
            -- Disable TexLab's built-in viewer since we'll use vimtex
            forwardSearch = {
              executable = nil,
              args = {},
            },
            chktex = {
              onOpenAndSave = true,  -- Enable linting on open and save
              onEdit = false,        -- Disable linting while editing (can be distracting)
            },
            diagnosticsDelay = 300,  -- Delay before showing diagnostics (in milliseconds)
            latexFormatter = "latexindent",  -- Code formatting tool
            latexindent = {
              ["local"] = nil,  -- Path to local latexindent config file
              modifyLineBreaks = false,
            },
          }
        }
      }
      -- Loop iterates through server-config pairs and enables them
      for server, config in pairs(Opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end
  }
}
