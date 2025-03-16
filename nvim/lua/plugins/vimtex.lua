return {
  {
    "lervag/vimtex",
    ft = "tex",  -- Lazy-load only when editing TeX files
    config = function()
      -- Put any vimtex-specific configuration here
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_view_method = 'zathura'  -- or another PDF viewer you prefer
      vim.g.vimtex_quickfix_mode = 0        -- Don't automatically open quickfix
      vim.g.vimtex_view_forward_search_on_start = false
      -- Add any other vimtex settings you need here
    end
  }
}
