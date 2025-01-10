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

		cmdline = {
			["<TAB>"] = { "select_next", "fallback" },
			["<S-TAB>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
		},
	},
	completion = {
		menu = {
			enabled = true,
			border = "rounded",
			-- draw = {
			-- 	columns = {
			-- 		{ "label", "label_description", gap = 1 },
			-- 		{ "kind_icon", gap = 1, "kind" },
			-- 	},
			-- },
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
	sources = {
		cmdline = {},
	},
	signature = {
		enabled = true,
		window = {
			border = "rounded",
		},
	},
})
