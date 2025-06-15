--Match Neomvim clipboard to system clipboard
vim.opt.clipboard      = 'unnamedplus'

--Replace default tab indenting with spaces
vim.opt.shiftwidth     = 4

-- Line Numbers
vim.opt.number         = true
vim.opt.relativenumber = true

-- Line Wrapping
vim.opt.wrap           = false

--Theme
vim.opt.background     = "dark" -- or "light" for light mode
vim.opt.signcolumn     = "yes"
vim.opt.showmode       = false
vim.opt.winborder      = "rounded"
vim.g.markdown_fenced_languages = {
  'python', 'lua', 'bash=sh', 'javascript', 'html', 'css', 'cpp', 'rust'
}
