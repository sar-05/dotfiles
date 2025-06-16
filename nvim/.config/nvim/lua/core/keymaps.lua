--Sourcing current file, line and seletion
vim.keymap.set("n", "<space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>X", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Clear search highlighting
vim.keymap.set("n", "<leader>nh", "<cmd>noh<CR>", { desc = "Clear search highlights" })

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<leader>sm", "<cmd>Maximize<CR>", { desc = "Toggle maximize" })

-- Take me to wiki
vim.keymap.set("n", "<leader>ww", "<cmd>e ~/Documents/wiki/index.md<CR>", { desc = "Go to main wiki" })
