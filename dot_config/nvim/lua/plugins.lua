return {
	-- colorscheme
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme catppuccin")
			vim.cmd("highlight WinSeparator guifg=#424362")
		end,
	},

	-- tree-sitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("config/treesitter")
		end,
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
		config = function()
			require("config/lspsaga")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
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
		config = function()
			require("config/cmp")
		end,
	},
	---- copilot
	{
		"zbirenbaum/copilot.lua",
		event = "VeryLazy",
		config = function()
			require("config/copilot")
		end,
	},

	-- dap
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("config/dap")
		end,
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
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
		config = function()
			require("highlight-undo").setup()
		end,
	},

	-- status line
	{
		"hoob3rt/lualine.nvim",
		config = function()
			require("config/lualine")
		end,
	},

	-- emphasis indent
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				indent = {
					char = "╎",
					tab_char = "╎",
					smart_indent_cap = true,
				},
				scope = {
					enabled = true,
					show_start = false,
					show_end = false,
					injected_languages = true,
				},
				exclude = {
					filetypes = { "dashboard" },
				},
			})
		end,
	},

	-- comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
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
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},

	-- git
	---- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
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
			})
		end,
	},
	---- conflict
	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup({
				default_mappings = true, -- disable buffer local mapping created by this plugin
				default_commands = true, -- disable commands created by this plugin
				disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
				list_opener = "copen", -- command or function to open the conflicts list
				highlights = { -- They must have background color, otherwise the default color will be used
					incoming = "DiffAdd",
					current = "DiffText",
				},
			})
		end,
	},
	---- gitlinker
	{
		"ruifm/gitlinker.nvim",
		config = function()
			require("gitlinker").setup()
		end,
	},

	-- org mode
	{
		"nvim-orgmode/orgmode",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", lazy = true },
		},
		event = "VeryLazy",
		config = function()
			-- Load treesitter grammar for org
			require("orgmode").setup_ts_grammar()

			-- Setup treesitter
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "org" },
				},
				ensure_installed = { "org" },
			})

			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})
		end,
	},

	-- markdown previewer
	{
		"topazape/md-preview.nvim",
		ft = { "md", "markdown", "mkd", "mkdn", "mdwn", "mdown", "mdtxt", "mdtext", "rmd", "wiki" },
		config = function()
			vim.keymap.set("n", "<leader>m", "<CMD>MPToggle<CR>", {})
			require("md-preview").setup({
				viewer = {
					exec = "glow",
					args = { "-s", "dracula" },
				},
			})
		end,
	},

	-- startup
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup()
		end,
	},
}
