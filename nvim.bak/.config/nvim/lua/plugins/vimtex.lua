return {
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      -- Existing settings
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_forward_search_on_start = false
      
      -- Additional settings for better integration with LSP
      vim.g.vimtex_compiler_latexmk = {
        build_dir = '',
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        hooks = {},
        options = {
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }
      
      -- Keep using vimtex's TOC and navigation features
      vim.g.vimtex_toc_config = {
        mode = 1,
        fold_enable = 0,
        hide_line_numbers = 1,
        resize = 0,
        refresh_always = 1,
        show_help = 0,
        show_numbers = 1,
        split_pos = 'leftabove',
        split_width = 30,
        tocdepth = 3,
        indent_levels = 1,
      }
      
      -- For mappings specific to vimtex, you can add them here
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'tex',
        callback = function()
          -- Example: Add any custom vimtex mappings here
          -- vim.keymap.set('n', '<leader>lt', '<cmd>VimtexTocToggle<CR>', {buffer=true})
        end
      })
    end
  }
}
