return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		bigfile = { enable = true },
		dashboard = { enabled = false },
		explorer = { enabled = true },
		indent = {
			enabled = true,
			indent = {
				char = "┆",
				indent = {
					hl = (function()
						local groups = {}
						for i = 1, 12 do
							groups[i] = "RainbowDarkDelim" .. i
						end
						return groups
					end)(),
				},
			},
		},
		input = { enabled = true },
		notifier = { enabled = true },
		picker = {
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
						["<M-s>"] = { "edit_split", mode = { "n", "i" } },
						["<M-v>"] = { "edit_vsplit", mode = { "n", "i" } },
					},
				},
			},
		},
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = true },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},

	keys = {
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fe",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>tb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame",
		},
	},
}
