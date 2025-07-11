--Match Neomvim clipboard to system clipboard
vim.opt.clipboard                = 'unnamedplus'

--Replace default tab indenting with spaces
vim.opt.expandtab                = true
vim.opt.shiftwidth               = 2
vim.opt.softtabstop              = 2
vim.opt.tabstop                  = 2

--Disables function which only purpose is to set tab as 4 spaces in .md files
vim.g.markdown_recommended_style = 0
-- vim.wo.conceallevel             = 2 -- Default tree-sitter md concealing

-- Line Numbers
vim.opt.number                   = true
vim.opt.relativenumber           = true

-- Line Wrapping
vim.opt.wrap                     = false

--Theme
vim.opt.background               = "dark" -- or "light" for light mode
vim.opt.signcolumn               = "yes"
vim.opt.showmode                 = false
vim.opt.winborder                = "rounded"
vim.g.markdown_fenced_languages  = {
  'python', 'lua', 'bash=sh', 'javascript', 'html', 'css', 'cpp', 'rust'
}

vim.diagnostic.config({
  virtual_text = true
})

--Fold config for nvim-ufo
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
