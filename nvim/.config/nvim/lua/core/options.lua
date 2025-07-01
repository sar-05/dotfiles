--Match Neomvim clipboard to system clipboard
vim.opt.clipboard               = 'unnamedplus'

--Replace default tab indenting with spaces
vim.opt.expandtab               = true
vim.opt.shiftwidth              = 2
vim.opt.softtabstop             = 2
vim.opt.tabstop                 = 2

-- Line Numbers
vim.opt.number                  = true
vim.opt.relativenumber          = true

-- Line Wrapping
vim.opt.wrap                    = false

--Theme
vim.opt.background              = "dark" -- or "light" for light mode
vim.opt.signcolumn              = "yes"
vim.opt.showmode                = false
vim.opt.winborder               = "rounded"
vim.g.markdown_fenced_languages = {
    'python', 'lua', 'bash=sh', 'javascript', 'html', 'css', 'cpp', 'rust'
}

-- vim.wo.conceallevel             = 2 --Tree-sitter md concealing
vim.diagnostic.config({
    virtual_text = true
})
