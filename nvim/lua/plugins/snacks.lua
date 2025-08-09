return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bufdelete = { enabled = true }, -- Deletes buffers without disrupting window layout
    bigfile = { enabled = true },   --Optimizes big files
    indent = { enabled = true },    --Indent lines
    notifier = { enabled = true },  --Better notifications
    scroll = { enabled = true },    --Smooth scrolling
    picker = {                      --Modern picker
      enabled = true,
      frecency = true,
      layout = "ivy",
      sources = {
        grep = {
          hidden = true
        },
        keymaps = {
          layout = "select"
        }
      }
    },
    image = {
      enabled = true,
      -- Preview images are first converted to .png and copied to
      -- :lua print(vim.fn.stdpath("cache") .. "/snacks/image")
      doc = {
        inline = false,
        float = true,
        max_width = 50,
        max_height = 25,
      },
    },
    statuscolumn = { enabled = true },
    explorer = { enabled = false },
    dashboard = { enabled = false },
    input = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    --Picker
    { "<leader><space>", function() Snacks.picker.smart() end,           desc = "Smart Find Files" },
    { "<leader>,",       function() Snacks.picker.buffers() end,         desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,            desc = "Grep" },
    { "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n",       function() Snacks.picker.notifications() end,   desc = "Notification History" },
    { "<leader>k",       function() Snacks.picker.keymaps() end,         desc = "Keymap List" },
    { "<leader>H",       function() Snacks.picker.help() end,            desc = "Help Pages" },
    -- Snacks file explorer
    { "<leader>e",       function() Snacks.explorer() end,               desc = "File Explorer" }
  }
}
