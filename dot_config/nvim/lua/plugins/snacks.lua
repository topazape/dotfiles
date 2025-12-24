return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	opts = {
		bigfile = { enable = true },
		dashboard = { enabled = false },
		explorer = {
			enabled = true,
			replace_netrw = true,
			trash = true,
		},
		indent = {
			enabled = true,
			indent = { char = "┊" },
			scope = { char = "│" },
		},
		input = { enabled = true },
		notifier = {
			enabled = true,
			style = "fancy",
		},
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
			sources = {
				explorer = {
					win = {
						list = {
							keys = {
								-- ["<BS>"] = "explorer_up",
								["<BS>"] = false,
								["l"] = "confirm",
								["h"] = "explorer_close", -- close directory
								["a"] = "explorer_add",
								["d"] = "explorer_del",
								["r"] = "explorer_rename",
								["c"] = "explorer_copy",
								["m"] = "explorer_move",
								["o"] = "explorer_open", -- open with system application
								["P"] = "toggle_preview",
								["y"] = { "explorer_yank", mode = { "n", "x" } },
								["p"] = "explorer_paste",
								["u"] = "explorer_update",
								["<c-c>"] = "tcd",
								["<leader>/"] = "picker_grep",
								["<c-t>"] = "terminal",
								["."] = "explorer_focus",
								["I"] = "toggle_ignored",
								["H"] = "toggle_hidden",
								["Z"] = "explorer_close_all",
								["]g"] = "explorer_git_next",
								["[g"] = "explorer_git_prev",
								["]d"] = "explorer_diagnostic_next",
								["[d"] = "explorer_diagnostic_prev",
								["]w"] = "explorer_warn_next",
								["[w"] = "explorer_warn_prev",
								["]e"] = "explorer_error_next",
								["[e"] = "explorer_error_prev",
							},
						},
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
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
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
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
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
		-- git
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		{
			"<leader>gt",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
