-- Set leader key to space
vim.g.mapleader = " "

-- General keymaps
vim.keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
vim.keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
vim.keymap.set("n", "<leader>ww", ":w<CR>") -- save
vim.keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

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
vim.keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
vim.keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
vim.keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
vim.keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
vim.keymap.set("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
vim.keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

-- Yazi-nvim
vim.keymap.set("n", "<leader>-", ":Yazi<CR>") --Opens Yazi at the current file
vim.keymap.set("n", "<leader>-", ":Yazi cwd<CR>") --Opens Yazi at the current working directory 
vim.keymap.set("n", "<leader>-", ":Yazi toggle<CR>") --Opens the last Yazi session 

-- Telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = "Find files" }) -- fuzzy find files in project
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {desc = "Find contents"}) -- grep file contents in project
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {desc = "Find buffer"}) -- fuzzy find open buffers
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {desc = "Find tags"}) -- fuzzy find help tags
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {desc = "Find in buffer"}) -- fuzzy find in current file buffer
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {desc = "Find in LSP/class symbols"}) -- fuzzy find LSP/class symbols
vim.keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {desc = "Find LSP/incoming calls"}) -- fuzzy find LSP/incoming calls
vim.keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({symbols={'function', 'method'}}) end, {desc = "Find methods"}) -- fuzzy find methods in current class
vim.keymap.set('n', '<leader>ft', function() -- grep file contents in current nvim-tree node
  local success, node = pcall(function() return require('nvim-tree.lib').get_node_at_cursor() end)
  if not success or not node then return end;
  require('telescope.builtin').live_grep({search_dirs = {node.absolute_path}})
end, {desc = "Find in nvim-tree node"})

-- Git-blame
vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle git blame" }) -- 

-- Harpoon
vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, {desc = "Mark file"})
vim.keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, {desc = "Harpoon UI"})
vim.keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end)
vim.keymap.set("n", "<leader>h5", function() require("harpoon.ui").nav_file(5) end)
vim.keymap.set("n", "<leader>h6", function() require("harpoon.ui").nav_file(6) end)
vim.keymap.set("n", "<leader>h7", function() require("harpoon.ui").nav_file(7) end)
vim.keymap.set("n", "<leader>h8", function() require("harpoon.ui").nav_file(8) end)
vim.keymap.set("n", "<leader>h9", function() require("harpoon.ui").nav_file(9) end)

-- LSP 
-- Deprecated syntax
-- keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
-- keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
-- keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
-- keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
-- keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
-- keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

-- Defined only after buffer with actived LSP server is attached
vim.api.nvim_create_autocmd(
	"LspAttach",
	{ --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>
			-- Notification of LspAttach 
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if client then
				vim.notify("LSP [" .. client.name .. "] attached", vim.log.levels.INFO)
			end
			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
      vim.keymap.set('n', '<leader>gg', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>tr', vim.lsp.buf.document_symbol, opts)
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
			-- Open the diagnostic under the cursor in a float window
			vim.keymap.set("n", "<leader>d", function()
				vim.diagnostic.open_float({
					border = "rounded",
				})
			end, opts)
		end,
	}
)

-- Vimwiki
vim.keymap.set('n', '<leader>ww', '<Plug>VimwikiIndex')
vim.keymap.set('n', '<leader>wt', '<Plug>VimwikiTabIndex')
vim.keymap.set('n', '<leader>ws', '<Plug>VimwikiUISelect')
vim.keymap.set('n', '<leader>wi', '<Plug>VimwikiDiaryIndex')
vim.keymap.set('n', '<leader>w<leader>w', '<Plug>VimwikiMakeDiaryNote')
vim.keymap.set('n', '<leader>w<leader>t', '<Plug>VimwikiTabMakeDiaryNote')
