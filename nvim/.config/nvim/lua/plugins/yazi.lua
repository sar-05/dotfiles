-- ---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		-- check the installation instructions at
		-- https://github.com/folke/snacks.nvim
		"folke/snacks.nvim"
	},
	keys = {
		{ "<leader>-",  "<cmd>Yazi<cr>",        desc = "Open yazi at the current file" },
		{ "<leader>cw", "<cmd>Yazi cwd<cr>",    desc = "Open yazi in nvim's working directory" },
		{ "<c-up>",     "<cmd>Yazi toggle<cr>", desc = "Resume the last yazi session" }
	},
	-- ---@type YaziConfig | {}
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		-- vim.g.loaded_netrw = 1
		-- Breaks ability to download spell files!
		-- https://www.reddit.com/r/neovim/comments/108hnsb/getting_error_in_neovim_warning_cannot_find_word/
		-- Turn on and off to download a spell file
		vim.g.loaded_netrwPlugin = 1
	end,
}
