return {
	"nvimdev/lspsaga.nvim",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},

	keys = {
		{ "K", "<CMD>Lspsaga hover_doc<CR>", noremap = true },
		{ "KK", "<CMD>Lspsaga hover_doc ++keep<CR>", noremap = true },
		{ "gd", "<CMD>Lspsaga peek_definition<CR>", noremap = true },
		{ "gk", "<CMD>Lspsaga peek_type_definition<CR>", noremap = true },
		{ "gr", "<CMD>Lspsaga finder<CR>", noremap = true },
		{ "ga", "<CMD>Lspsaga code_action<CR>", noremap = true },
		{ "gn", "<CMD>Lspsaga rename<CR>", noremap = true },
		{ "ge", "<CMD>Lspsaga show_line_diagnostics<CR>", noremap = true },
		{ "go", "<CMD>Lspsaga outline<CR>", noremap = true },
		{ "g]", "<CMD>Lspsaga diagnostic_jump_next<CR>", noremap = true },
		{ "g[", "<CMD>Lspsaga diagnostic_jump_prev<CR>", noremap = true },
		{ "<C-\\>", "<CMD>Lspsaga term_toggle<CR>", noremap = true },
	},

	opts = {
		ui = {
			border = "rounded",
			code_action = "󱐋 ",
			lines = { "└", "├", "│", "─", "┌" },
			imp_sign = " ",
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
	},
}
