return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
			})
			vim.cmd.colorscheme("tokyonight")
			vim.cmd("highlight WinSeparator guifg=#3d59a1 guibg=None")
			vim.cmd("highlight DiagnosticHint guifg=#ffc777 guibg=None")
		end,
	},

	-- devicon
	{
		"nvim-tree/nvim-web-devicons",
	},
	---- adjust devicon
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
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
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("config/lsp")
		end,
	},
	---- lspsaga
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("config/lspsaga")
		end,
	},
	---- inlay hints
	{
		"MysticalDevil/inlay-hints.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		event = "LspAttach",
		config = true,
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
		version = "v0.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = {
				["<C-g>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-f>"] = { "accept" },
				["<TAB>"] = { "accept" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-j>"] = { "scroll_documentation_down" },
				["<C-k>"] = { "scroll_documentation_up" },
			},
			list = {
				selection = "auto_insert",
			},
			menu = {
				border = "solid",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 50,
				window = {
					border = "solid",
				},
				ghost_text = {
					enabled = false,
				},
			},
			signature = {
				enabled = true,
				window = {
					border = "solid",
				},
			},
			windows = {
				autocomplete = {
					border = "rounded",
					selection = "auto_insert",
				},
				documentation = {
					border = "rounded",
					auto_show = true,
					auto_show_delay_ms = 50,
					update_delay_ms = 50,
				},
				signature_help = {
					border = "rounded",
				},
			},
		},
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
	---- notify
	{
		"rcarriga/nvim-notify",
	},

	---- status line
	{
		"hoob3rt/lualine.nvim",
		config = function()
			require("config/lualine")
		end,
	},

	-- mode highlight
	{
		"rasulomaroff/reactive.nvim",
		opts = {
			builtin = {
				cursorline = true,
				cursor = true,
				modemsg = true,
			},
		},
	},
	---- help
	{
		"OXY2DEV/helpview.nvim",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- highlight-undo
	{
		"tzachar/highlight-undo.nvim",
		config = true,
	},

	-- colorcode preview
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			render = "virtual",
			virtual_symbol = "",
			virtual_symbol_prefix = " ",
			virtual_symbol_position = "eol",
		},
	},

	-- AI
	---- copilot
	{
		"zbirenbaum/copilot.lua",
		opts = {
			panel = { enabled = false },
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<M-f>",
				},
			},
			filetypes = {
				cvs = false,
				gitcommit = false,
				gitrebase = false,
				go = false,
				help = false,
				hgcommit = false,
				markdown = false,
				python = false,
				rust = false,
				svn = false,
				yaml = false,
				["."] = false,
			},
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
	---- GitHub
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			use_local_fs = true,
			ssh_aliases = {
				["github-tver"] = "github.com",
			},
			suppress_missing_scope = {
				projects_v2 = true,
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
		opts = {
			heading = {
				position = "inline",
			},
			code = {
				width = "block",
				left_margin = 2,
			},
			-- for blink.cmp documentation and signature_help
			overrides = {
				buftype = {
					nofile = {
						render_modes = { "n", "c", "i" },
						code = { width = "full" },
					},
				},
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
