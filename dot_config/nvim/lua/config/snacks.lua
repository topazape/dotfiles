require("snacks").setup({
	animate = { enabled = false },
	bigfile = { enabled = false },
	bufdelete = { enabled = false },
	dashboard = { enabled = false },
	debug = { enabled = false },
	dim = { enabled = false },
	explorer = { enabled = true },
	gh = { enabled = false },
	git = { enabled = false },
	gitbrowse = { enabled = false },
	image = { enabled = false },
	indent = { enabled = false },
	input = { enabled = true },
	keymap = { enabled = false },
	picker = {
		enabled = false,
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n", "i" } },
					["<M-s>"] = { "edit_split", mode = { "i", "n" } },
					["<M-v>"] = { "edit_vsplit", mode = { "i", "n" } },
				},
			},
			list = {
				keys = {},
			},
		},
	},
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = false },
	statuscolumn = { enabled = true },
	words = { enabled = true },
})
