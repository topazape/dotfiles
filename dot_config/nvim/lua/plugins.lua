local M = {}
M.config = function(flavour)
	require("catppuccin").setup({
		flavour = flavour,
		integrations = {
			cmp = true,
			dap = true,
			dap_ui = true,
			dashboard = true,
			gitsigns = true,
			lsp_saga = true,
			mason = true,
			noice = true,
			notify = true,
			telescope = { enabled = true },
			treesitter = true,
			rainbow_delimiters = true,
		},
	})
	vim.cmd.colorscheme("catppuccin")
	local colors = require("catppuccin.palettes").get_palette(flavour)
	vim.cmd("highlight WinSeparator guifg=" .. colors.overlay0)
end

return {
	-- colorscheme
	{
		"catppuccin/nvim",
		-- priority = 1000,
		config = function()
			-- M.config("latte")
			-- M.config("frappe")
			M.config("macchiato")
			-- M.config("mocha")
		end,
	},

	-- devicon
	{
		"nvim-tree/nvim-web-devicons",
	},
	-- nice devicon colors
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
		config = function()
			require("config/copilot")
		end,
	},

	-- debugging
	---- dap
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			require("config/dap")
		end,
	},
	---- ui
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		event = "VeryLazy",
	},
	---- debug print
	{
		"andrewferrier/debugprint.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
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

	-- highlight undo
	{
		"tzachar/highlight-undo.nvim",
		config = true,
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
			load = {
				"catppuccin-macchiato-cursor",
				"catppuccin-mocha-cursorline",
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
	---- diffview
	{
		"sindrets/diffview.nvim",
		config = true,
	},

	-- markdown
	{
		"MeanderingProgrammer/markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
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

	-- startup
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = true,
	},
}
