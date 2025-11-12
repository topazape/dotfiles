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
			"folke/ts-comments.nvim",
			event = "VeryLazy",
			config = true,
			enable = vim.fn.has("nvim-0.10.0") == 1,
		},
		{ "nvim-tree/nvim-web-devicons", config = true },
		{ "HiPhish/rainbow-delimiters.nvim" },
		{ "williamboman/mason.nvim", config = true },
		{ "j-hui/fidget.nvim", config = true },
		{ "b0o/schemastore.nvim" },
		{ "OXY2DEV/helpview.nvim" },
		{ "tzachar/highlight-undo.nvim", config = true },
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

		{ import = "plugins.oldtale" },
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
