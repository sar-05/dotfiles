-- Set leader key to space
vim.g.mapleader = " "

-- IMPORTANT: Neovim 0.10+ includes these LSP/diagnostic defaults:
-- K          -> vim.lsp.buf.hover
-- gd         -> vim.lsp.buf.definition
-- gD         -> vim.lsp.buf.declaration
-- gi         -> vim.lsp.buf.implementation
-- go         -> vim.lsp.buf.type_definition
-- gr         -> vim.lsp.buf.references
-- [d, ]d     -> vim.diagnostic.goto_prev/next
-- <C-W>d     -> vim.diagnostic.open_float
--
-- Neovim 0.11+ adds these GLOBAL defaults:
-- grn        -> vim.lsp.buf.rename
-- gra        -> vim.lsp.buf.code_action (visual and normal mode)
-- grr        -> vim.lsp.buf.references
-- gri        -> vim.lsp.buf.implementation
-- gO         -> vim.lsp.buf.document_symbol
-- <C-S>      -> vim.lsp.buf.signature_help (insert mode)

-- Better Escape
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Save file
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Better navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Move lines 
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Paste without yanking in visual mode
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Clear search highlighting
vim.keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- General keymaps
vim.keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { desc = "Open URL under cursor" })

-- Buffer navigation (vim-like with [ and ])
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })

-- Window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Toggle maximize" })

-- Resize windows with Alt + hjkl
-- vim.keymap.set("n", "<M-j>", "<C-w>-", { desc = "make split height shorter" })
-- vim.keymap.set("n", "<M-k>", "<C-w>+", { desc = "make split height taller" })
-- vim.keymap.set("n", "<M-l>", "<C-w>>5", { desc = "make split wider" })
-- vim.keymap.set("n", "<M-h>", "<C-w><5", { desc = "make split skinnier" })

-- Tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "[t", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "]t", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Quickfix navigation (vim-like)
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix list" })

-- Diagnostics (Note: [d, ]d, <C-W>d are now defaults in 0.10+)
vim.keymap.set("n", "<leader>xq", vim.diagnostic.setloclist, { desc = "Open diagnostics quickfix list" })

-- Diff keymaps (Note: [c, ]c are default for diff navigation)
vim.keymap.set("n", "<leader>dc", "<cmd>diffput<CR>", { desc = "Put diff from current to other" })
vim.keymap.set("n", "<leader>dj", "<cmd>diffget 1<CR>", { desc = "Get diff from left (local)" })
vim.keymap.set("n", "<leader>dk", "<cmd>diffget 3<CR>", { desc = "Get diff from right (remote)" })

-- File manager
vim.keymap.set("n", "<leader>-", "<cmd>Yazi<cr>", { desc = "Open Yazi file manager" })

-- Telescope (lazy loaded to avoid startup issues)
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = "Find by grep" })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = "Find help" })
vim.keymap.set('n', '<leader>fs', function() require('telescope.builtin').current_buffer_fuzzy_find() end, { desc = "Find in current buffer" })
vim.keymap.set('n', '<leader>fo', function() require('telescope.builtin').lsp_document_symbols() end, { desc = "Find symbols" })
vim.keymap.set('n', '<leader>fr', function() require('telescope.builtin').oldfiles() end, { desc = "Find recent files" })
vim.keymap.set('n', '<leader>fc', function() require('telescope.builtin').commands() end, { desc = "Find commands" })
vim.keymap.set('n', '<leader>fk', function() require('telescope.builtin').keymaps() end, { desc = "Find keymaps" })
vim.keymap.set('n', '<leader>fd', function() require('telescope.builtin').diagnostics() end, { desc = "Find diagnostics" })
vim.keymap.set('n', '<leader>ft', function() require('telescope.builtin').git_files() end, { desc = "Find git files" })

-- Git
vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<CR>", { desc = "Toggle git blame" })

-- Harpoon (lazy loaded to avoid startup issues)
vim.keymap.set("n", "<leader>ha", function() require("harpoon.mark").add_file() end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Harpoon quick menu" })
vim.keymap.set("n", "<leader>hn", function() require("harpoon.ui").nav_next() end, { desc = "Harpoon next file" })
vim.keymap.set("n", "<leader>hp", function() require("harpoon.ui").nav_prev() end, { desc = "Harpoon previous file" })
-- Quick navigation with Alt/Cmd + number (more ergonomic)
for i = 1, 9 do
  vim.keymap.set("n", "<A-" .. i .. ">", function() require("harpoon.ui").nav_file(i) end, { desc = "Harpoon to file " .. i })
end

-- Vimwiki
vim.keymap.set('n', '<leader>ww', '<Plug>VimwikiIndex', { desc = "Open wiki index" })
vim.keymap.set('n', '<leader>wt', '<Plug>VimwikiTabIndex', { desc = "Open wiki in new tab" })
vim.keymap.set('n', '<leader>ws', '<Plug>VimwikiUISelect', { desc = "Select wiki" })
vim.keymap.set('n', '<leader>wi', '<Plug>VimwikiDiaryIndex', { desc = "Open diary index" })
vim.keymap.set('n', '<leader>w<leader>w', '<Plug>VimwikiMakeDiaryNote', { desc = "Create diary note" })
vim.keymap.set('n', '<leader>w<leader>t', '<Plug>VimwikiTabMakeDiaryNote', { desc = "Create diary note in tab" })

-- LSP keymaps (attached in autocmd)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Notify when an LSP activates
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      vim.notify("LSP [" .. client.name .. "] attached", vim.log.levels.INFO)
    end

    -- Buffer local mappings for LSP functions that DON'T have defaults
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    -- Note: These are defaults in Neovim 0.10+/0.11+:
    -- K -> vim.lsp.buf.hover
    -- gd -> vim.lsp.buf.definition
    -- gD -> vim.lsp.buf.declaration  
    -- gi -> vim.lsp.buf.implementation
    -- go -> vim.lsp.buf.type_definition
    -- gr -> vim.lsp.buf.references
    -- grn -> vim.lsp.buf.rename (0.11+)
    -- gra -> vim.lsp.buf.code_action (0.11+)
    -- grr -> vim.lsp.buf.references (0.11+)
    -- gri -> vim.lsp.buf.implementation (0.11+)
    -- gO -> vim.lsp.buf.document_symbol (0.11+)
    -- <C-S> -> vim.lsp.buf.signature_help (insert mode, 0.11+)

    -- Only map functions that truly don't have good defaults
    map('n', '<leader>cf', function()
      vim.lsp.buf.format({ async = true })
    end, "Format document")
  end,
})
