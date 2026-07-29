return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",

	keys = {
		{ "K", "<CMD>Lspsaga hover_doc<CR>" },
		{ "KK", "<CMD>Lspsaga hover_doc ++keep<CR>" },
		{ "gd", "<CMD>Lspsaga peek_definition<CR>" },
		{ "gk", "<CMD>Lspsaga peek_type_definition<CR>" },
		{ "gr", "<CMD>Lspsaga finder<CR>" },
		{ "ga", "<CMD>Lspsaga code_action<CR>" },
		{ "gn", "<CMD>Lspsaga rename<CR>" },
		{ "ge", "<CMD>Lspsaga show_line_diagnostics<CR>" },
		{ "go", "<CMD>Lspsaga outline<CR>" },
		{ "g]", "<CMD>Lspsaga diagnostic_jump_next<CR>" },
		{ "g[", "<CMD>Lspsaga diagnostic_jump_prev<CR>" },
		{ "<C-\\>", "<CMD>Lspsaga term_toggle<CR>" },
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
