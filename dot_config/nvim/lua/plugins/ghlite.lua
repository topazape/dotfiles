return {
	"daliusd/ghlite.nvim",
	lazy = false,
	opts = {
		debug = false, -- if set to true debugging information is written to ~/.ghlite.log file
		view_split = "vsplit", -- set to empty string '' to open in active buffer, use 'tabnew' to open in tab
		diff_split = "vsplit", -- set to empty string '' to open in active buffer, use 'tabnew' to open in tab
		diff_tool = "auto", -- 'diffview', 'codediff', or 'auto' - which tool to use for GHLitePRDiffview
		comment_split = "split", -- set to empty string '' to open in active buffer, use 'tabnew' to open in tab
		open_command = "open", -- open command to use, e.g. on Linux you might want to use xdg-open
		merge = {
			approved = "--squash",
			nonapproved = "--auto --squash",
		},
		html_comments_command = { "lynx", "-stdin", "-dump" }, -- command to render HTML comments in PR view
		-- override default keymaps with the ones you prefer
		-- set keymap to false or '' to disable it
		keymaps = {
			diff = {
				open_file = "gf",
				open_file_tab = "",
				open_file_split = "o",
				open_file_vsplit = "O",
				approve = "cA",
				request_changes = "cR",
			},
			comment = {
				send_comment = "c<CR>", -- this one cannot be disabled
			},
			pr = {
				approve = "cA",
				request_changes = "cR",
				merge = "cM",
				comment = "ca",
				diff = "cp",
			},
		},
	},
	keys = {
		{ "<LEADER>us", ":GHLitePRSelect<CR>", silent = true, desc = "PR Select" },
		{ "<LEADER>uo", ":GHLitePRCheckout<CR>", silent = true, desc = "PR Checkout" },
		{ "<LEADER>uv", ":GHLitePRView<CR>", silent = true, desc = "PR View" },
		{ "<LEADER>uu", ":GHLitePRLoadComments<CR>", silent = true, desc = "PR Load Comments" },
		{ "<LEADER>up", ":GHLitePRDiff<CR>", silent = true, desc = "PR Diff" },
		{ "<LEADER>ul", ":GHLitePRDiffview<CR>", silent = true, desc = "PR Diffview" },
		{ "<LEADER>ua", ":GHLitePRAddComment<CR>", silent = true, desc = "PR Add comment" },
		{ "<LEADER>ua", ":GHLitePRAddComment<CR>", mode = "x", silent = true, desc = "PR Add comment" },
		{ "<leader>uc", ":GHLitePRUpdateComment<CR>", silent = true, desc = "PR Update comment" },
		{ "<leader>ud", ":GHLitePRDeleteComment<CR>", silent = true, desc = "PR Delete comment" },
		{ "<leader>ug", ":GHLitePROpenComment<CR>", silent = true, desc = "PR Open comment" },
	},
}
