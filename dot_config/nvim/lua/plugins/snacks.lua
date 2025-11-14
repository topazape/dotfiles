return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		picker = {
			input = {
				keys = {
					["<c-s>"] = false,
					["<a-s>"] = "edit_split",
				},
			},
		},
	},
}
