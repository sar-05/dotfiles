-- Session Management
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
vim.opt.number         = true
vim.opt.relativenumber = true

-- Tabs & Indentation
vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true
vim.opt.autoindent     = true
vim.bo.softtabstop     = 2

-- Line Wrapping
vim.opt.wrap           = false

-- Search Settings
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

-- Cursor Line
vim.opt.cursorline     = true

-- Appearance
vim.opt.termguicolors  = true
vim.opt.background     = "dark"
vim.opt.signcolumn     = "yes"
vim.opt.showmode       = false
vim.opt.winborder      = "rounded"

-- Backspace
vim.opt.backspace      = "indent,eol,start"

-- Split Windows
vim.opt.splitright     = true
vim.opt.splitbelow     = true

-- Consider - as part of keyword
vim.opt.iskeyword:append("-")

-- Disable the mouse while in nvim
vim.opt.mouse = ""

-- Folding
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds
