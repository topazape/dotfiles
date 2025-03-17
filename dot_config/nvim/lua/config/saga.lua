local lspsaga = require("lspsaga")
lspsaga.setup({
	-- keymaps for lspsaga
	vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", { noremap = true }),
	vim.keymap.set("n", "KK", "<CMD>Lspsaga hover_doc ++keep<CR>", { noremap = true }),
	vim.keymap.set("n", "gd", "<CMD>Lspsaga peek_definition<CR>", { noremap = true }),
	vim.keymap.set("n", "gk", "<CMD>Lspsaga peek_type_definition<CR>", { noremap = true }),
	vim.keymap.set("n", "gr", "<CMD>Lspsaga finder<CR>", { noremap = true }),
	vim.keymap.set("n", "ga", "<CMD>Lspsaga code_action<CR>", { noremap = true }),
	vim.keymap.set("n", "gn", "<CMD>Lspsaga rename<CR>", { noremap = true }),
	vim.keymap.set("n", "ge", "<CMD>Lspsaga show_line_diagnostics<CR>", { noremap = true }),
	vim.keymap.set("n", "go", "<CMD>Lspsaga outline<CR>", { noremap = true }),
	vim.keymap.set("n", "g]", "<CMD>Lspsaga diagnostic_jump_next<CR>", { noremap = true }),
	vim.keymap.set("n", "g[", "<CMD>Lspsaga diagnostic_jump_prev<CR>", { noremap = true }),
	vim.keymap.set("n", "<C-\\>", "<CMD>Lspsaga term_toggle<CR>", { noremap = true }),

	ui = {
		border = "rounded",
		code_action = "󱐋 ",
		lines = { "└", "├", "│", "─", "┌" },
		imp_sign = "󰌗 ",
	},

	lightbulb = {
		virtual_text = false,
	},

	scroll_preview = {
		scroll_down = "<C-n>",
		scroll_up = "<C-p>",
	},

	finder = {
		max_height = 0.8,
		left_width = 0.3,
		right_width = 0.6,
		default = "imp+tyd+def+ref",
		keys = {
			split = "s",
			toggle_or_open = "o",
			vsplit = "v",
		},
	},

	definition = {
		width = 0.8,
		height = 0.7,
		keys = {
			close = "q",
			edit = "o",
			split = "s",
			vsplit = "v",
		},
	},

	implement = {
		enable = true,
	},

	outline = {
		close_after_jump = true,
	},
})
