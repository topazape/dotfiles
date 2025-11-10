require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	picker = {
		enabled = true,
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n", "i" } },
					["<M-s>"] = { "edit_split", mode = { "i", "n" } },
					["<M-v>"] = { "edit_vsplit", mode = { "i", "n" } },
				},
			},
			list = {
				keys = {
					["<a-s>"] = "edit_split",
					["<a-v>"] = "edit_vsplit",
				},
			},
		},
	},
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
})
