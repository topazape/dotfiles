-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
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
		{
			"folke/ts-comments.nvim",
			event = "VeryLazy",
			config = true,
			enable = vim.fn.has("nvim-0.10.0") == 1,
		},

		{ "nvim-tree/nvim-web-devicons" },
		{ "HiPhish/rainbow-delimiters.nvim" },
		{ "williamboman/mason.nvim" },
		{ "j-hui/fidget.nvim" },
		{ "b0o/schemastore.nvim" },
		{ "OXY2DEV/helpview.nvim" },
		{ "tzachar/highlight-undo.nvim" },
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
		{
			"sphamba/smear-cursor.nvim",
			opts = {
				cursor_color = "none",
			},
		},
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
		{
			"rainbowhxch/accelerated-jk.nvim",
			config = function()
				vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
				vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})
			end,
		},

		{ import = "plugins.treesitter" },
		{ import = "plugins.blink-cmp" },
		{ import = "plugins.conform" },
		{ import = "plugins.gitsigns" },
		{ import = "plugins.lspsaga" },
		{ import = "plugins.snacks" },
		{ import = "plugins.lualine" },
		{ import = "plugins.copilot" },
	},
})
