local lspsaga = require("lspsaga")
lspsaga.setup({
	-- keymaps for lspsaga
	vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", { noremap = true }),
	vim.keymap.set("n", "gd", "<CMD>Lspsaga peek_definition<CR>", { noremap = true }),
	vim.keymap.set("n", "gr", "<CMD>Lspsaga finder<CR>", { noremap = true }),
	vim.keymap.set("n", "ga", "<CMD>Lspsaga code_action<CR>", { noremap = true }),
	vim.keymap.set("n", "gn", "<CMD>Lspsaga rename<CR>", { noremap = true }),
	vim.keymap.set("n", "ge", "<CMD>Lspsaga show_line_diagnostics<CR>", { noremap = true }),
	vim.keymap.set("n", "go", "<CMD>Lspsaga outline<CR>", { noremap = true }),
	vim.keymap.set("n", "g]", "<CMD>Lspsaga diagnostic_jump_next<CR>", { noremap = true }),
	vim.keymap.set("n", "g[", "<CMD>Lspsaga diagnostic_jump_prev<CR>", { noremap = true }),
	vim.keymap.set("n", "<A-t>", "<CMD>Lspsaga term_toggle<CR>", { noremap = true }),

	definition = {
		width = 0.8,
		height = 0.7,
		keys = {
			close = "k",
			edit = "e",
			quit = "q",
			split = "s",
			vsplit = "v",
		},
	},
	finder = {
		max_height = 0.8,
		left_width = 0.2,
		right_width = 0.8,
	},
	ui = {
		border = "rounded", -- Can be single, double, rounded, solid, shadow.
		lines = { "└", "├", "│", "─", "┌" },
	},
	scroll_down = "<C-n>",
	scroll_up = "<C-p>",
})
