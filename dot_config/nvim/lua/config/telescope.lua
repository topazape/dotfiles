local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

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
vim.keymap.set("n", "<leader>fe", "<CMD>Telescope file_browser<CR>", {})
-- noice
vim.keymap.set("n", "<leader>nh", "<CMD>Telescope noice<CR>", {})
-- aerial
vim.keymap.set("n", "<leader>aa", "<CMD>Telescope aerial<CR>", {})

telescope.setup({
	defaults = {
		-- Default configuration for telescope goes here:
		winblend = 20,
		prompt_prefix = "▷  ",
		selection_caret = " ",
		mappings = {
			i = {
				["<ESC>"] = actions.close,
				["<M-s>"] = actions.select_horizontal,
				["<M-v>"] = actions.select_vertical,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
		file_browser = {
			hidden = true,
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

telescope.load_extension("file_browser")
telescope.load_extension("noice")
telescope.load_extension("aerial")
