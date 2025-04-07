return {
	-- Look and feel
	---- colorscheme
	{
		dir = "~/Develop/local/oldtale.nvim",
		lazy = false,
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
					telescope = true,
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
	---- mason
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
	---- progress
	{
		"j-hui/fidget.nvim",
		config = true,
	},

	-- completion
	{
		"saghen/blink.cmp",
		lazy = false,
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("config/blink-cmp")
		end,
	},

	-- formatter
	{
		"stevearc/conform.nvim",
		config = function()
			require("config/conform")
		end,
	},

	-- telescopes
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("config/telescope")
		end,
	},
	---- file browser
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
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
	---- f/F moving hilights
	{
		"jinh0/eyeliner.nvim",
		opts = {
			highlight_on_key = true,
			dim = true,
		},
	},
	---- super cursor
	{ "sphamba/smear-cursor.nvim", opts = {} },

	-- AI
	---- copilot
	{
		"zbirenbaum/copilot.lua",
		opts = {
			panel = { enabled = false },
			suggestion = {
				enabled = true,
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
	---- avante
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false,
		build = "make",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"zbirenbaum/copilot.lua",
		},
		opts = {
			provider = "copilot",
			copilot = {
				model = "claude-3.7-sonnet",
			},
			mappings = {
				sidebar = {
					close = { "q" },
				},
			},
			windows = {
				width = 40,
			},
		},
	},
	---- mcp
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		cmd = "MCPHub",
		build = "npm install -g mcp-hub@latest",
		config = true,
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
	---- github
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			ssh_aliases = {
				["github-work"] = "github.com",
			},
		},
	},

	-- markdown
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
		},
	},

	-- typst
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst", -- or ft = 'typst'
		version = "1.*",
		build = function()
			require("typst-preview").update()
		end,
	},
}
