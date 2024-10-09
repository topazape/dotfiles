local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- extentions
telescope.load_extension("file_browser")
telescope.load_extension("notify")

-- mappings
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, {})
-- git
vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
-- file_browser
vim.keymap.set("n", "<leader>fe", "<CMD>Telescope file_browser hidden=true<CR>", {})

telescope.setup({
	defaults = {
		-- Default configuration for telescope goes here:
		winblend = 20,
		prompt_prefix = "▷ ",
		selection_caret = "▶ ",
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<M-s>"] = actions.select_horizontal,
				["<M-v>"] = actions.select_vertical,
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			file_ignore_patterns = {
				"^.cache/",
				"^.kube/",
				"^.local/",
				"^.zcompcache/",
				"^.zsh_sessions/",
				"^Applications/",
				"^Library/",
				"^.git/",
			},
		},
	},
	extensions = {
		file_browser = {
			-- hidden = { file_browser = true, folder_browser = true },
			git_status = true,
			hijack_netrw = true,
			mappings = {
				i = {
					["<ESC>"] = actions.close,
					["<M-s>"] = actions.select_horizontal,
					["<M-v>"] = actions.select_vertical,
				},
			},
		},
	},
})
