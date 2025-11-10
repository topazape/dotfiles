return {
	-- Look and feel
	---- colorscheme
	{
		dir = "~/Develop/local/oldtale.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oldtale").setup({
				integrations = {
					blink = true,
					gitsigns = true,
					lazy = true,
					lsp = true,
					markdown = true,
					mason = true,
					noice = true,
					notify = true,
					octo = true,
					rainbow_delimiters = true,
					saga = true,
					telescope = false,
					treesitter = true,
				},
			})
			vim.cmd.colorscheme("oldtale")
		end,
	},
	---- devicon
	{
		"nvim-tree/nvim-web-devicons",
		config = true,
	},

	-- tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("config/treesitter")
		end,
	},
	---- rainbow
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
	---- comment
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		config = true,
		enable = vim.fn.has("nvim-0.10.0") == 1,
	},

	-- lsp
	{
		"williamboman/mason.nvim",
		config = true,
	},
	---- lspsaga
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("config/saga")
		end,
	},
	---- completion
	{
		"saghen/blink.cmp",
		lazy = false,
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"fang2hou/blink-copilot",
		},
		config = function()
			require("config/blink-cmp")
		end,
	},
	---- notification
	{
		"j-hui/fidget.nvim",
		config = true,
	},
	---- schemaStore
	{
		"b0o/schemastore.nvim",
	},

	-- formatter
	{
		"stevearc/conform.nvim",
		config = function()
			require("config/conform")
		end,
	},

	-- UI
	---- key speed
	{
		"rainbowhxch/accelerated-jk.nvim",
		config = function()
			vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
			vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})
		end,
	},
	---- status line
	{
		"hoob3rt/lualine.nvim",
		config = function()
			require("config/lualine")
		end,
	},
	---- help
	{
		"OXY2DEV/helpview.nvim",
		lazy = false,
	},
	---- highlight-undo
	{
		"tzachar/highlight-undo.nvim",
		config = true,
	},
	---- colorcode preview
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			render = "virtual",
			virtual_symbol = "",
			virtual_symbol_prefix = " ",
			virtual_symbol_position = "eol",
			exclude_filetypes = { "lazy", "mason" },
		},
	},
	---- super cursor
	{
		"sphamba/smear-cursor.nvim",
		opts = {
			cursor_color = "none",
		},
	},

	-- picker
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opt = {
			bigfile = { enabled = true },
			dashboard = { enabled = false },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },

			keys = {
				{
					"<leader><space>",
					function()
						Snacks.picker.smart()
					end,
					desc = "Smart Find Files",
				},
				{
					"<leader>,",
					function()
						Snacks.picker.buffers()
					end,
					desc = "Buffers",
				},
				{
					"<leader>/",
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
					"<leader>e",
					function()
						Snacks.explorer()
					end,
					desc = "File Explorer",
				},
				-- find
				{
					"<leader>fb",
					function()
						Snacks.picker.buffers()
					end,
					desc = "Buffers",
				},
				{
					"<leader>fc",
					function()
						Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
					end,
					desc = "Find Config File",
				},
				{
					"<leader>ff",
					function()
						Snacks.picker.files()
					end,
					desc = "Find Files",
				},
				{
					"<leader>fg",
					function()
						Snacks.picker.git_files()
					end,
					desc = "Find Git Files",
				},
				{
					"<leader>fp",
					function()
						Snacks.picker.projects()
					end,
					desc = "Projects",
				},
				{
					"<leader>fr",
					function()
						Snacks.picker.recent()
					end,
					desc = "Recent",
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
				-- gh
				{
					"<leader>gi",
					function()
						Snacks.picker.gh_issue()
					end,
					desc = "GitHub Issues (open)",
				},
				{
					"<leader>gI",
					function()
						Snacks.picker.gh_issue({ state = "all" })
					end,
					desc = "GitHub Issues (all)",
				},
				{
					"<leader>gp",
					function()
						Snacks.picker.gh_pr()
					end,
					desc = "GitHub Pull Requests (open)",
				},
				{
					"<leader>gP",
					function()
						Snacks.picker.gh_pr({ state = "all" })
					end,
					desc = "GitHub Pull Requests (all)",
				},
				-- Grep
				{
					"<leader>sb",
					function()
						Snacks.picker.lines()
					end,
					desc = "Buffer Lines",
				},
				{
					"<leader>sB",
					function()
						Snacks.picker.grep_buffers()
					end,
					desc = "Grep Open Buffers",
				},
				{
					"<leader>sg",
					function()
						Snacks.picker.grep()
					end,
					desc = "Grep",
				},
				{
					"<leader>sw",
					function()
						Snacks.picker.grep_word()
					end,
					desc = "Visual selection or word",
					mode = { "n", "x" },
				},
				-- search
				{
					'<leader>s"',
					function()
						Snacks.picker.registers()
					end,
					desc = "Registers",
				},
				{
					"<leader>s/",
					function()
						Snacks.picker.search_history()
					end,
					desc = "Search History",
				},
				{
					"<leader>sa",
					function()
						Snacks.picker.autocmds()
					end,
					desc = "Autocmds",
				},
				{
					"<leader>sb",
					function()
						Snacks.picker.lines()
					end,
					desc = "Buffer Lines",
				},
				{
					"<leader>sc",
					function()
						Snacks.picker.command_history()
					end,
					desc = "Command History",
				},
				{
					"<leader>sC",
					function()
						Snacks.picker.commands()
					end,
					desc = "Commands",
				},
				{
					"<leader>sd",
					function()
						Snacks.picker.diagnostics()
					end,
					desc = "Diagnostics",
				},
				{
					"<leader>sD",
					function()
						Snacks.picker.diagnostics_buffer()
					end,
					desc = "Buffer Diagnostics",
				},
				{
					"<leader>sh",
					function()
						Snacks.picker.help()
					end,
					desc = "Help Pages",
				},
				{
					"<leader>sH",
					function()
						Snacks.picker.highlights()
					end,
					desc = "Highlights",
				},
				{
					"<leader>si",
					function()
						Snacks.picker.icons()
					end,
					desc = "Icons",
				},
				{
					"<leader>sj",
					function()
						Snacks.picker.jumps()
					end,
					desc = "Jumps",
				},
				{
					"<leader>sk",
					function()
						Snacks.picker.keymaps()
					end,
					desc = "Keymaps",
				},
				{
					"<leader>sl",
					function()
						Snacks.picker.loclist()
					end,
					desc = "Location List",
				},
				{
					"<leader>sm",
					function()
						Snacks.picker.marks()
					end,
					desc = "Marks",
				},
				{
					"<leader>sM",
					function()
						Snacks.picker.man()
					end,
					desc = "Man Pages",
				},
				{
					"<leader>sp",
					function()
						Snacks.picker.lazy()
					end,
					desc = "Search for Plugin Spec",
				},
				{
					"<leader>sq",
					function()
						Snacks.picker.qflist()
					end,
					desc = "Quickfix List",
				},
				{
					"<leader>sR",
					function()
						Snacks.picker.resume()
					end,
					desc = "Resume",
				},
				{
					"<leader>su",
					function()
						Snacks.picker.undo()
					end,
					desc = "Undo History",
				},
				{
					"<leader>uC",
					function()
						Snacks.picker.colorschemes()
					end,
					desc = "Colorschemes",
				},
				-- LSP
				{
					"gd",
					function()
						Snacks.picker.lsp_definitions()
					end,
					desc = "Goto Definition",
				},
				{
					"gD",
					function()
						Snacks.picker.lsp_declarations()
					end,
					desc = "Goto Declaration",
				},
				{
					"gr",
					function()
						Snacks.picker.lsp_references()
					end,
					nowait = true,
					desc = "References",
				},
				{
					"gI",
					function()
						Snacks.picker.lsp_implementations()
					end,
					desc = "Goto Implementation",
				},
				{
					"gy",
					function()
						Snacks.picker.lsp_type_definitions()
					end,
					desc = "Goto T[y]pe Definition",
				},
				{
					"gai",
					function()
						Snacks.picker.lsp_incoming_calls()
					end,
					desc = "C[a]lls Incoming",
				},
				{
					"gao",
					function()
						Snacks.picker.lsp_outgoing_calls()
					end,
					desc = "C[a]lls Outgoing",
				},
				{
					"<leader>ss",
					function()
						Snacks.picker.lsp_symbols()
					end,
					desc = "LSP Symbols",
				},
				{
					"<leader>sS",
					function()
						Snacks.picker.lsp_workspace_symbols()
					end,
					desc = "LSP Workspace Symbols",
				},
				-- Other
				{
					"<leader>z",
					function()
						Snacks.zen()
					end,
					desc = "Toggle Zen Mode",
				},
				{
					"<leader>Z",
					function()
						Snacks.zen.zoom()
					end,
					desc = "Toggle Zoom",
				},
				{
					"<leader>.",
					function()
						Snacks.scratch()
					end,
					desc = "Toggle Scratch Buffer",
				},
				{
					"<leader>S",
					function()
						Snacks.scratch.select()
					end,
					desc = "Select Scratch Buffer",
				},
				{
					"<leader>n",
					function()
						Snacks.notifier.show_history()
					end,
					desc = "Notification History",
				},
				{
					"<leader>bd",
					function()
						Snacks.bufdelete()
					end,
					desc = "Delete Buffer",
				},
				{
					"<leader>cR",
					function()
						Snacks.rename.rename_file()
					end,
					desc = "Rename File",
				},
				{
					"<leader>gB",
					function()
						Snacks.gitbrowse()
					end,
					desc = "Git Browse",
					mode = { "n", "v" },
				},
				{
					"<leader>gg",
					function()
						Snacks.lazygit()
					end,
					desc = "Lazygit",
				},
				{
					"<leader>un",
					function()
						Snacks.notifier.hide()
					end,
					desc = "Dismiss All Notifications",
				},
				{
					"<c-/>",
					function()
						Snacks.terminal()
					end,
					desc = "Toggle Terminal",
				},
				{
					"<c-_>",
					function()
						Snacks.terminal()
					end,
					desc = "which_key_ignore",
				},
				{
					"]]",
					function()
						Snacks.words.jump(vim.v.count1)
					end,
					desc = "Next Reference",
					mode = { "n", "t" },
				},
				{
					"[[",
					function()
						Snacks.words.jump(-vim.v.count1)
					end,
					desc = "Prev Reference",
					mode = { "n", "t" },
				},
				{
					"<leader>N",
					desc = "Neovim News",
					function()
						Snacks.win({
							file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
							width = 0.6,
							height = 0.6,
							wo = {
								spell = false,
								wrap = false,
								signcolumn = "yes",
								statuscolumn = " ",
								conceallevel = 3,
							},
						})
					end,
				},
			},
			init = function()
				vim.api.nvim_create_autocmd("User", {
					pattern = "VeryLazy",
					callback = function()
						-- Setup some globals for debugging (lazy-loaded)
						_G.dd = function(...)
							Snacks.debug.inspect(...)
						end
						_G.bt = function()
							Snacks.debug.backtrace()
						end

						-- Override print to use snacks for `:=` command
						if vim.fn.has("nvim-0.11") == 1 then
							vim._print = function(_, ...)
								dd(...)
							end
						else
							vim.print = _G.dd
						end

						-- Create some toggle mappings
						Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
						Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
						Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
						Snacks.toggle.diagnostics():map("<leader>ud")
						Snacks.toggle.line_number():map("<leader>ul")
						Snacks.toggle
							.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
							:map("<leader>uc")
						Snacks.toggle.treesitter():map("<leader>uT")
						Snacks.toggle
							.option("background", { off = "light", on = "dark", name = "Dark Background" })
							:map("<leader>ub")
						Snacks.toggle.inlay_hints():map("<leader>uh")
						Snacks.toggle.indent():map("<leader>ug")
						Snacks.toggle.dim():map("<leader>uD")
					end,
				})
			end,
		},
	},

	-- AI
	---- copilot
	{
		"zbirenbaum/copilot.lua",
		opts = {
			filetypes = {
				txt = true,
				markdown = true,
				json = true,
				yaml = true,
				toml = true,
				sql = true,
				dbt = true,
				["*"] = false,
			},
			panel = {
				enabled = false,
			},
			suggestion = {
				-- enabled = true,
				enabled = false,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 25,
				keymap = {
					accept = "<M-f>",
					next = "<M-n>",
					prev = "<M-p>",
					dissmiss = "<M-q>",
				},
			},
		},
	},
	---- claude
	{
		"coder/claudecode.nvim",
		opts = {
			terminal = {
				split_side = "right", -- "left" or "right"
				split_width_percentage = 0.40,
				provider = "native", -- "auto", "snacks", "native", "external", "none", or custom provider table
				auto_close = true,
				snacks_win_opts = {}, -- Opts to pass to `Snacks.terminal.open()` - see Floating Window section below
			},
		},
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},

	-- git
	---- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config/gitsigns")
		end,
	},
	---- conflict
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
	},

	-- languages
	---- golang
	{
		"fredrikaverpil/godoc.nvim",
		version = "*",
		dependencies = {
			"folke/snacks.nvim",
		},
		opts = {
			picker = { type = "snacks" },
		},
	},
	---- typst
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst", -- or ft = 'typst'
		version = "1.*",
		build = function()
			require("typst-preview").update()
		end,
	},

	---- dbt
	{
		"PedramNavid/dbtpal",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = true,
	},

	---- markdown
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		ft = { "markdown", "Avante" },
		opts = {
			heading = {
				position = "inline",
			},
			code = {
				width = "block",
				left_margin = 2,
			},
			bullet = {
				icons = { "•", "∘", "▪", "▫" },
			},
			completions = {
				lsp = { enabled = true },
			},
		},
	},
}
