return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bufdelete = { enabled = true }, -- Essential for yazi.nvim
    bigfile = { enabled = true },   --Optimizes big files
    indent = { enabled = true },    --Indent lines
    notifier = { enabled = true },  --Better notifications
    scroll = { enabled = true },
    picker = {                      --Modern picker
      enabled = true,
      frecency = true,
    },
    explorer = { enabled = true },
    image = { enabled = true },
    statuscolumn = { enabled = true },
    dashboard = { enabled = false },
    input = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    --Picker
    { "n", "<leader><space>", function() Snacks.picker.smart() end,           desc = "Smart Find Files" },
    { "n", "<leader>,",       function() Snacks.picker.buffers() end,         desc = "Buffers" },
    { "n", "<leader>/",       function() Snacks.picker.grep() end,            desc = "Grep" },
    { "n", "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command History" },
    { "n", "<leader>n",       function() Snacks.picker.notifications() end,   desc = "Notification History" },
    { "n", "<leader>k",       function() Snacks.picker.keymaps() end,         desc = "Keymap List" },
    { "n", "<leader>H",       function() Snacks.picker.help() end,            desc = "Help Pages" },
    -- Snacks file explorer
    { "n", "<leader>e",       function() Snacks.explorer() end,               desc = "File Explorer" }
  }
}
