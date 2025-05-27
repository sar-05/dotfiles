return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp"
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'lua_ls',
          'hyprls',
          'pyright',
          'bashls',
          'marksman',
          'taplo',
          'texlab'
        }
      })
      local servers = {
        lua_ls = {},
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
              }
            }
          }
        },
        marksman = {},
        bashls = {},
        taplo = {},
        hyprls = {},
        texlab = {
          settings = {
            texlab = {
              build = {
                onSave = false,
                executable = "latexmk",
                args = {"-pdf", "-interaction=nonstopmode", "-synctex=1", "%f"},
              },
              forwardSearch = {
                executable = nil,
                args = {},
              },
              chktex = {
                onOpenAndSave = true,
                onEdit = false,
              },
              diagnosticsDelay = 300,
              latexFormatter = "latexindent",
              latexindent = {
                ["local"] = nil,
                modifyLineBreaks = false,
              },
            }
          }
        }
      }
      -- Configure and enable each server
      for server, config in pairs(servers) do
        -- Configure the server with the new default Neovim API
        vim.lsp.config(server, config)
        -- Enable the server
        vim.lsp.enable(server)
      end
    end
  }
}
