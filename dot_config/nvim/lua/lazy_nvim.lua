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
		{ import = "plugins.oldtale" },

		{ import = "plugins.agentic" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.blink-cmp" },
		{ import = "plugins.conform" },
		{ import = "plugins.gitsigns" },
		{ import = "plugins.lspsaga" },
		{ import = "plugins.snacks" },
		{ import = "plugins.lualine" },
		{ import = "plugins.copilot" },
		{ import = "plugins.render-markdown" },
		{ import = "plugins.gopher" },
		{ import = "plugins.godoc" },

		{ "HiPhish/rainbow-delimiters.nvim" },
		{ "OXY2DEV/helpview.nvim" },
		{ "PedramNavid/dbtpal", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
		{ "akinsho/git-conflict.nvim", version = "*", config = true },
		{ "b0o/schemastore.nvim" },
		{ "chomosuke/typst-preview.nvim", ft = "typst", version = "1.*", config = true },
		{ "folke/ts-comments.nvim", event = "VeryLazy", config = true },
		{ "j-hui/fidget.nvim", config = true },
		{ "magal1337/dataform.nvim", config = true },
		{ "nvim-tree/nvim-web-devicons", config = true },
		{ "tzachar/highlight-undo.nvim", config = true },
		{ "williamboman/mason.nvim", config = true },
		{
			"rainbowhxch/accelerated-jk.nvim",
			config = function()
				vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
				vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})
			end,
		},
	},
})
