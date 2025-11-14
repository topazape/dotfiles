return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		picker = {
			prompt = "> ",
			win = {
				input = {
					keys = {
						-- ["<Esc>"] = { "close", mode = { "n", "i" } },
						["/"] = false,
						["<C-Down>"] = false,
						["<C-Up>"] = false,
						["<C-c>"] = false,
						["<C-w>"] = false,
						["<CR>"] = false,
						["<Down>"] = false,
						["<S-CR>"] = false,
						["<S-Tab>"] = false,
						["<Tab>"] = false,
						["<Up>"] = false,
						["<a-d>"] = false,
						["<a-f>"] = false,
						["<a-h>"] = false,
						["<a-i>"] = false,
						["<a-r>"] = false,
						["<a-m>"] = false,
						["<a-p>"] = false,
						["<a-w>"] = false,
						["<c-a>"] = false,
						["<c-b>"] = false,
						["<c-d>"] = false,
						["<c-f>"] = false,
						["<c-g>"] = false,
						["<c-j>"] = false,
						["<c-k>"] = false,
						["<c-q>"] = false,
						["<c-s>"] = false,
						["<c-t>"] = false,
						["<c-u>"] = false,
						["<c-v>"] = false,
						["<c-r>#"] = false,
						["<c-r>%"] = false,
						["<c-r><c-a>"] = false,
						["<c-r><c-f>"] = false,
						["<c-r><c-l>"] = false,
						["<c-r><c-p>"] = false,
						["<c-r><c-w>"] = false,
						["<c-w>H"] = false,
						["<c-w>J"] = false,
						["<c-w>K"] = false,
						["<c-w>L"] = false,
						["?"] = false,
						["G"] = false,
						["gg"] = false,
						["j"] = false,
						["k"] = false,
						["q"] = false,
					},
				},
			},
		},
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
			"<leader>s",
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
	},
}
