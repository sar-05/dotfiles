-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { 'williamboman/mason.nvim' },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { 'williamboman/mason-lspconfig.nvim' },

    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- Install these LSPs automatically
      ensure_installed = {
        -- 'bashls', -- requires npm to be installed
        -- 'cssls', -- requires npm to be installed
        -- 'html', -- requires npm to be installed
        'lua_ls',
        -- 'jsonls', -- requires npm to be installed
        'lemminx',
        'marksman',
        'quick_lint_js',
        'pyright',
        -- 'tsserver', -- requires npm to be installed
        -- 'yamlls', -- requires npm to be installed
      }
    })

    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
      -- Keybindings for LSP functionality
      local opts = { noremap=true, silent=true, buffer=bufnr }
      -- Navigation
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      -- Code actions and diagnostics
     vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
     vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
     vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
     -- Print notification when LSP attaches
     vim.notify("LSP " .. client.name .. " started for buffer " .. bufnr, vim.log.levels.INFO)
    end

    -- Replace the problematic section with this approach
    local mason_lspconfig = require('mason-lspconfig')
    local lspconfig = require('lspconfig')
    
    -- Get the list of servers that mason-lspconfig knows about
    local installed_servers = mason_lspconfig.get_installed_servers()
    
    -- Set up each installed server
    for _, server_name in ipairs(installed_servers) do
      -- Special handling for specific servers can go here
      if server_name == "lua_ls" then
        lspconfig[server_name].setup({
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = {'vim'},
              },
            },
          },
        })
      elseif server_name == "pyright" then
        -- Your existing pyright configuration
        lspconfig[server_name].setup({
          filetypes = { "python" },
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
              },
            },
          },
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      else
        -- Default configuration for all other servers
        lspconfig[server_name].setup({
          on_attach = lsp_attach,
          capabilities = lsp_capabilities,
        })
      end
    end

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    }
    -- Python LSP settings
    lspconfig.pyright.setup {
      filetypes = { "python" },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
          },
        },
      },
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    }
-- TeX LSP settings
lspconfig.texlab.setup {
  settings = {
    texlab = {
      -- Disable TexLab's build functionality since we'll use vimtex for this
      build = {
        onSave = false,
        executable = "latexmk",
        args = {"-pdf", "-interaction=nonstopmode", "-synctex=1", "%f"},
      },
      -- Disable TexLab's built-in viewer functionality since we'll use vimtex
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
    },
  },
  on_attach = function(client, bufnr)
    -- Call the existing lsp_attach function first
    lsp_attach(client, bufnr)
    -- Apply TeX-specific keymappings here if needed
    local opts = { noremap=true, silent=true, buffer=bufnr }
    -- For example:
    -- vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts)
  end,
  capabilities = lsp_capabilities,
}

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end

  end
}
