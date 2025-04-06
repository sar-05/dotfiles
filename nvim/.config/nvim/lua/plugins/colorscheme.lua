return {
  'ellisonleao/gruvbox.nvim',
  --  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    transparent = false,-- Let transparent.nvim handle this
    contrast = "medium", -- Optional: "soft", "medium", or "hard"
    transparent_mode = true,
  },
  config = function(_, opts)
    require('gruvbox').setup(opts)
    vim.cmd("colorscheme gruvbox")

    -- Keep your custom diff and border colors
    vim.cmd([[
      autocmd ColorScheme * hi DiffAdd guifg=#00FF00 guibg=#005500
      autocmd ColorScheme * hi DiffDelete guifg=#FF0000 guibg=#550000
      autocmd ColorScheme * hi DiffChange guifg=#CCCCCC guibg=#555555
      autocmd ColorScheme * hi DiffText guifg=#00FF00 guibg=#005500
      
      autocmd ColorScheme * hi NormalFloat guifg=#F9E7C0 guibg=#1F1F1F
      autocmd ColorScheme * hi FloatBorder guifg=#F9E7C0 guibg=#1F1F1F
    ]])
  end
}
