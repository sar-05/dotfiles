return{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bufdelete = { enabled = true }, -- Essential for yazi.nvim
    bigfile = { enabled = true }, --Optimizes big files
    indent = { enabled = true }, --Indent lines
    notifier = { enabled = true }, --Better notifications
    scroll = { enabled = true },
    picker = { --Modern picker
      enabled = true,
      frecency = true,
    },
    image = {enabled = true},
    dashboard = { enabled = false },
    explorer = { enabled = false },
    input = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  keys = {
      }
}

