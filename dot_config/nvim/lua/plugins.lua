return {
	-- colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				styles = {},
				dim_inactive = true,
				lualine_bold = true,
			})
			vim.cmd.colorscheme("tokyonight")
			vim.cmd("highlight WinSeparator guifg=#999999")
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

	-- completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		event = "InsertEnter",
		config = function()
			require("config/cmp")
		end,
	},

	-- formatter
	{
		"stevearc/conform.nvim",
		config = function()
			require("config/conform")
		end,
	},

	-- AI
	---- copilot
	{
		"zbirenbaum/copilot.lua",
		event = "VeryLazy",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				filetypes = {
					markdown = true,
				},
			},
			filetypes = {
				go = false,
				markdown = true,
				python = false,
				rust = false,
			},
		},
	},

	-- debugging
	---- debug print
	{
		"andrewferrier/debugprint.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		version = "*",
		config = true,
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

	-- completely replaces the UI for messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("notify").setup({ timeout = 100, top_down = true })
			require("config/noice")
		end,
	},

	-- status line
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

	-- emphasis indent
	{
		"shellRaining/hlchunk.nvim",
		event = "UIEnter",
		opts = {
			chunk = {
				enable = true,
				notify = true,
				use_treesitter = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = "▷",
				},
			},
			indent = {
				enable = false,
				use_treesitter = true,
			},
			line_num = {
				enable = true,
				use_treesitter = true,
			},
			blank = {
				enable = false,
			},
		},
	},

	-- highlight-undo
	{
		"tzachar/highlight-undo.nvim",
    opts = {
      duration = 300,
    },
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
		config = {
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
		},
		opts = {
			-- max_file_size = 1.5, -- MB
			bullet = { icons = { "•", "◦", "▪", "▫", "‣" } },
		},
	},

	-- typst
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst", -- or ft = 'typst'
		version = "0.3.*",
		build = function()
			require("typst-preview").update()
		end,
	},

	-- help
	{
		"OXY2DEV/helpview.nvim",
		lazy = false,

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- startup
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = true,
	},
}
