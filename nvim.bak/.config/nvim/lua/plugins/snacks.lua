return{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bufdelete = { enabled = true },  -- Essential for yazi.nvim
    picker = { enabled = true },     -- Optional: for Ctrl+S search in yazi
    bigfile = { enabled = true },
    indent = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
}
