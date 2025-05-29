-- Set leader key to space
vim.g.mapleader = " "

-- General keymaps
vim.keymap.set("n", "<leader>W", ":wq<CR>", { desc = "Save and quit" }) -- Changed from wq to avoid conflict
vim.keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Quit without saving" }) -- quit without saving
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" }) -- Changed from ww to avoid Vimwiki conflict
vim.keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { desc = "Open with system app" }) -- open URL under cursor

-- Split window management
vim.keymap.set("n", "<leader>%", "<C-w>v", { desc = "split vertically" }) -- 
vim.keymap.set("n", '<leader>"', "<C-w>s", { desc = "split horizontally" }) -- 
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal" }) -- 
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close split window" }) -- 
vim.keymap.set("n", "<M-j>", "<C-w>-", { desc = "make split height shorter" }) -- 
vim.keymap.set("n", "<M-k>", "<C-w>+", { desc = "make split height taller" }) -- 
vim.keymap.set("n", "<M-l>", "<C-w>>5", { desc = "make split wider" }) -- 
vim.keymap.set("n", "<M-h>", "<C-w><5", { desc = "make split skinnier" }) -- 
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "toggle maximize" }) -- Vim-maximizer

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Tab management
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "new tab" }) -- 
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close tab" }) -- 
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "next tab" }) -- 
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "previous tab" }) -- 

-- Diff keymaps
vim.keymap.set("n", "<leader>dc", ":diffput<CR>") -- put diff from current to other during diff
vim.keymap.set("n", "<leader>dj", ":diffget 1<CR>") -- get diff from left (local) during merge
vim.keymap.set("n", "<leader>dk", ":diffget 3<CR>") -- get diff from right (remote) during merge
vim.keymap.set("n", "<leader>dn", "]c") -- next diff hunk
vim.keymap.set("n", "<leader>dp", "[c") -- previous diff hunk

-- Quickfix keymaps
vim.keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "open quickfix" }) -- 
vim.keymap.set("n", "<leader>qf", ":cfirst<CR>", { desc = "jump to first item" }) -- 
vim.keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "jump to next item" }) -- 
vim.keymap.set("n", "<leader>qp", ":cprev<CR>", { desc = "jump to prev item" }) -- 
vim.keymap.set("n", "<leader>ql", ":clast<CR>", { desc = "jump to last item" }) -- 
vim.keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "close quickfix" }) -- 

-- Yazi-nvim (Fixed duplication - kept only one)
vim.keymap.set("n", "<leader>-", "<cmd>Yazi<cr>", { desc = "Open Yazi file manager" })

-- Telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = "Find files" }) -- fuzzy find files in project
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {desc = "Find contents"}) -- grep file contents in project
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {desc = "Find buffer"}) -- fuzzy find open buffers
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {desc = "Find tags"}) -- fuzzy find help tags
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {desc = "Find in buffer"}) -- fuzzy find in current file buffer
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {desc = "Find in LSP/class symbols"}) -- fuzzy find LSP/class symbols
vim.keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {desc = "Find LSP/incoming calls"}) -- fuzzy find LSP/incoming calls
vim.keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({symbols={'function', 'method'}}) end, {desc = "Find methods in class"}) -- fuzzy find methods in current class
-- vim.keymap.set('n', '<leader>ft', function() -- grep file contents in current nvim-tree node
--   local success, node = pcall(function() return require('nvim-tree.lib').get_node_at_cursor() end)
--   if not success or not node then return end;
--   require('telescope.builtin').live_grep({search_dirs = {node.absolute_path}})
-- end, {desc = "Find in nvim-tree node"})

-- Git-blame
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle git blame" }) -- 

-- Harpoon
vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Mark file" })
vim.keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon UI" })
vim.keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end, { desc = "Go to file 1" })
vim.keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end, { desc = "Go to file 2" })
vim.keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end, { desc = "Go to file 3" })
vim.keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end, { desc = "Go to file 4" })
vim.keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end, { desc = "Go to file 5" })
vim.keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end, { desc = "Go to file 6" })
vim.keymap.set("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end, { desc = "Go to file 7" })
vim.keymap.set("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end, { desc = "Go to file 8" })
vim.keymap.set("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end, { desc = "Go to file 9" })

-- Vimwiki (Now these work without conflict since we changed save keymaps)
vim.keymap.set('n', '<leader>ww', '<Plug>VimwikiIndex')
vim.keymap.set('n', '<leader>wt', '<Plug>VimwikiTabIndex')
vim.keymap.set('n', '<leader>ws', '<Plug>VimwikiUISelect')
vim.keymap.set('n', '<leader>wi', '<Plug>VimwikiDiaryIndex')
vim.keymap.set('n', '<leader>w<leader>w', '<Plug>VimwikiMakeDiaryNote')
vim.keymap.set('n', '<leader>w<leader>t', '<Plug>VimwikiTabMakeDiaryNote')

-- LSP completion (leveraging built-in LSP completion)
vim.keymap.set('i', '<C-Space>', function()
  if vim.bo.omnifunc == 'v:lua.vim.lsp.omnifunc' then
    return '<C-X><C-O>'
  else
    return '<C-Space>'
  end
end, { expr = true, desc = "Trigger completion" })

-- Note: Built-in commenting with 'gc' operator is available since Neovim 0.10
-- You can remove vim-commentary plugin if you want to use the built-in version

--  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd(
	"LspAttach",
	{
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>
			-- Notify when an LSP activates
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if client then
				vim.notify("LSP [" .. client.name .. "] attached", vim.log.levels.INFO)
			end
			-- Buffer local mappings for LSP functions that DON'T have defaults
			local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
      end
      -- Keep only LSP keymaps that don't conflict with defaults
      -- Removed: <leader>cg (use 'K'), <leader>cr (use 'grr'), <leader>cR (use 'grn'), 
      --          <leader>ca (use 'gra'), <leader>ci (use 'gri'), <leader>cS (use 'gO'),
      --          <leader>cs (use '<C-S>')
      map('n', 'gd', vim.lsp.buf.definition, "Go to definition")
      map('n', 'gD', vim.lsp.buf.declaration, "Go to declaration")
      map('n', 'gt', vim.lsp.buf.type_definition, "Go to type definition")
      map('n', '<leader>cf', function()
        vim.lsp.buf.format({ async = true })
      end, "Format document")
      map('n', '<leader>cd', function()
        vim.diagnostic.open_float({ border = "rounded" })
      end, "Open diagnostics")
		end,
	}
)
