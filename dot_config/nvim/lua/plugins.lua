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
	---- adjust devicon colors
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
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"giuxtaposition/blink-cmp-copilot",
		},
		opts = {
			keymap = {
				preset = "none",

				["<C-g>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-f>"] = { "accept", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "scroll_documentation_down", "fallback" },
				["<C-k>"] = { "scroll_documentation_up", "fallback" },

				cmdline = {
					["<TAB>"] = { "select_next", "fallback" },
					["<S-TAB>"] = { "select_prev", "fallback" },
					["<C-n>"] = { "select_next", "fallback" },
					["<C-p>"] = { "select_prev", "fallback" },
				},
			},
			completion = {
				menu = {
					enabled = true,
					border = "rounded",
					draw = {
						columns = {
							{ "label" },
						},
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 50,
					window = {
						border = "rounded",
					},
				},
				ghost_text = {
					enabled = false,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
					},
				},
				cmdline = {},
			},
			signature = {
				enabled = true,
				window = {
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
	---- mode highlight
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
	---- fold
	{
		"OXY2DEV/foldtext.nvim",
		lazy = false,
	},

	-- AI
	---- copilot
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
	---- copilot chat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			model = "claude-3.5-sonnet",
			prompts = {
				-- 選択されたコードの説明を段落形式で生成
				Explain = {
					prompt = "> /COPILOT_EXPLAIN\n\n選択されたコードの説明を段落のテキストとして書いてください。",
				},
				-- 選択されたコードのコードレビューを実行
				Review = {
					prompt = "> /COPILOT_REVIEW\n\n選択されたコードをレビューしてください。",
					-- 注：追加の実装詳細はconfig.luaにあります
				},
				-- 問題のあるコードの修正版を生成
				Fix = {
					prompt = "> /COPILOT_GENERATE\n\nこのコードには問題があります。バグを修正したコードを書き直してください。",
				},
				-- コードの性能と可読性を向上させる最適化
				Optimize = {
					prompt = "> /COPILOT_GENERATE\n\n選択されたコードの性能と可読性を改善するために最適化してください。",
				},
				-- コードにドキュメンテーションコメントを追加
				Docs = {
					prompt = "> /COPILOT_GENERATE\n\n選択されたコードにドキュメンテーションコメントを追加してください。",
				},
				-- コードのテストを生成
				Tests = {
					prompt = "> /COPILOT_GENERATE\n\nコードのテストを生成してください。",
				},
				-- commitizenの規約に従ってコミットメッセージを生成
				Commit = {
					prompt = "> #git:staged\n\ncommitizenの規約に従ってコミットメッセージを書いてください。タイトルは最大50文字とし、メッセージは72文字で折り返してください。メッセージ全体をgitcommit言語のコードブロックで囲んでください。",
				},
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
