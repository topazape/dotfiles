return {
	"sindrets/diffview.nvim",

	cmd = {
		"DiffviewClose",
		"DiffviewFileHistory",
		"DiffviewFocusFiles",
		"DiffviewOpen",
		"DiffviewRefresh",
		"DiffviewToggleFiles",
	},

	opts = {
		default_args = { -- Default args prepended to the arg-list for the listed commands
			DiffviewOpen = { "--imply-local" },
			DiffviewFileHistory = {},
		},
		keymaps = {
			view = {
				{ "n", "q", "<CMD>DiffviewClose<CR>", { desc = "Close Diffview" } },
			},
			file_panel = {
				{ "n", "q", "<CMD>DiffviewClose<CR>", { desc = "Close Diffview" } },
			},
			file_history_panel = {
				{ "n", "q", "<CMD>DiffviewClose<CR>", { desc = "Close Diffview" } },
			},
		},
	},
}
