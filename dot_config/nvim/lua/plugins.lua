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
		priority = 1000,
		config = function()
			-- M.config("latte")
			-- M.config("frappe")
			M.config("macchiato")
			-- M.config("mocha")
		end,
	},

	-- icons
	{
		"nvim-tree/nvim-web-devicons",
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

	-- format on save
	{
		"elentok/format-on-save.nvim",
		config = function()
			require("config/format-on-save")
		end,
	},

	-- completion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
		},
		event = "InsertEnter",
		config = function()
			require("config/cmp")
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

	-- dial
	{
		"monaqa/dial.nvim",
		config = function()
			require("config/dial")
		end,
	},

	-- colorcode preview
	{
		"brenoprata10/nvim-highlight-colors",
		opts = {
			render = "virtual",
			virtual_symbol = "●",
		},
	},

	-- git
	---- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			current_line_blame = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 100,
				ignore_whitespace = true,
			},

			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end
				-- Actions
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end)
				map("n", "<leader>tb", gs.toggle_current_line_blame)
			end,
		},
	},
	---- conflict
	{
		"akinsho/git-conflict.nvim",
		opts = {
			default_mappings = true, -- disable buffer local mapping created by this plugin
			default_commands = true, -- disable commands created by this plugin
			disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
			list_opener = "copen", -- command or function to open the conflicts list
			highlights = { -- They must have background color, otherwise the default color will be used
				incoming = "DiffAdd",
				current = "DiffText",
			},
		},
	},

	-- markdown
	{
		"MeanderingProgrammer/markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			-- Character to use for the bullet points in lists
			bullets = { "•", "◦", "▪", "▫", "‣" },
		},
	},

	-- startup
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = true,
	},
}
