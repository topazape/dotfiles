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
	---- sticky header
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({})
		end,
	},

	-- lsp
	{
		"williamboman/mason.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("config/lsp")
		end,
	},
	---- lspsaga
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				-- keymaps for lspsaga
				vim.keymap.set("n", "ga", "<CMD>Lspsaga code_action<CR>", { noremap = true }),
				vim.keymap.set("n", "go", "<CMD>Lspsaga outline<CR>", { noremap = true }),
				-- ui
				ui = {
					border = "double",
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	---- show lsp context
	{ "SmiteshP/nvim-navic" },

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
			require("copilot").setup({
				panel = {
					enabled = false,
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 100,
					keymap = {
						accept = "<TAB>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					cvs = false,
					gitcommit = false,
					gitrebase = false,
					help = false,
					hgcommit = false,
					svn = false,
					yaml = false,
					markdown = true,
					["."] = false,
				},
			})
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
		version = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("config/telescope")
		end,
	},
	---- filebrowser
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
	{ "lukas-reineke/indent-blankline.nvim" },

	-- colorcolumn
	{
		"lukas-reineke/virt-column.nvim",
		config = function()
			vim.cmd("set colorcolumn=100")
			vim.cmd("highlight VirtColumn guifg=#082f49")
			require("virt-column").setup({
				char = "│",
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
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
				},
				typescript = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.constant.new({ elements = { "let", "const" } }),
				},
				visual = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.alpha,
					augend.constant.alias.Alpha,
				},
			})
			vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual("visual"), { noremap = true })
			vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual("visual"), { noremap = true })
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
			require("git-conflict").setup()
		end,
	},

	-- startup
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VimEnter",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
}
