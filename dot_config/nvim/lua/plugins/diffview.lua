return {
	"sindrets/diffview.nvim",

	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" },

	opts = {
		default_args = { -- Default args prepended to the arg-list for the listed commands
			DiffviewOpen = { "--imply-local" },
			DiffviewFileHistory = {},
		},
	},

	keys = {
		{ "q", "<CMD>DiffviewClose<CR>", noremap = true },
	},
}
