return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require("harpoon")
    harpoon:setup()
    return {

      { "<leader>a", function() harpoon:list():add() end },
      { "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },

      { "<A-1>",     function() harpoon:list():select(1) end },
      { "<A-2>",     function() harpoon:list():select(2) end },
      { "<A-3>",     function() harpoon:list():select(3) end },
      { "<A-4>",     function() harpoon:list():select(4) end },

      -- Toggle previous & next buffers stored within Harpoon list
      { "<C-S-P>",   function() harpoon:list():prev() end },
      { "<C-S-N>",   function() harpoon:list():next() end },
    }
  end
}
