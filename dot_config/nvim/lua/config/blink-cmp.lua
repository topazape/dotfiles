local blinkcmp = require("blink-cmp")

blinkcmp.setup({
	keymap = {
		preset = "none",

		["<C-g>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-f>"] = { "accept", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "scroll_documentation_down", "fallback" },
		["<C-k>"] = { "scroll_documentation_up", "fallback" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	completion = {
		menu = {
			enabled = true,
			border = "rounded",
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", gap = 1, "kind" },
				},
				treesitter = { "lsp" },
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 50,
			window = {
				border = "rounded",
			},
		},
		ghost_text = {
			enabled = false,
		},
	},

	cmdline = {
		completion = {},
	},

	signature = {
		enabled = true,
		window = {
			border = "rounded",
		},
	},
})
