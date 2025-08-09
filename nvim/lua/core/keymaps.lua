--Sourcing current file, line and seletion
vim.keymap.set("n", "<space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>X", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Clear search highlighting
vim.keymap.set("n", "<leader>nh", "<cmd>noh<CR>", { desc = "Clear search highlights" })

-- Take me to wiki
vim.keymap.set("n", "<leader>ww", "<cmd>e ~/Documents/wiki/index.md<CR>", { desc = "Go to main wiki" })

-- New Tab
vim.keymap.set("n", "<C-W>t", "<cmd>tabnew<CR>", { desc = "New Tab" })
