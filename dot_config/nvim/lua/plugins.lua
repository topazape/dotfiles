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
		opt = require("config/snacks"),

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
