return {
	"esmuellert/codediff.nvim",
	cmd = "CodeDiff",
	opts = {
		diff = {
			layout = "inline", -- side-by-side | inline
			compute_moves = true,
		},
		explorer = {
			width = 30,
			view_mode = "tree",
			flatten_dirs = false,
			focus_on_select = true,
		},
	},
}
