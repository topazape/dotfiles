return {
	"lewis6991/gitsigns.nvim",

	opts = {
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		current_line_blame = false,
		current_line_blame_opts = {
			delay = 100,
		},
	},
}
