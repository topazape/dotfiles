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
		{ import = "plugins.blink-cmp" },
		{ import = "plugins.conform" },
		{ import = "plugins.diffview" },
		{ import = "plugins.ghlite" },
		{ import = "plugins.gitsigns" },
		{ import = "plugins.godoc" },
		{ import = "plugins.gopher" },
		{ import = "plugins.lspsaga" },
		{ import = "plugins.lualine" },
		{ import = "plugins.snacks" },

		{ "HiPhish/rainbow-delimiters.nvim", config = true },
		{ "OXY2DEV/helpview.nvim", config = true },
		{ "b0o/schemastore.nvim", config = true },
		{ "chomosuke/typst-preview.nvim", ft = "typst", version = "1.*", config = true },
		{ "folke/ts-comments.nvim", config = true },
		{ "j-hui/fidget.nvim", config = true },
		{ "nvim-tree/nvim-web-devicons", config = true },
		{ "romus204/tree-sitter-manager.nvim", opts = { auto_install = true } },
		{ "tzachar/highlight-undo.nvim", config = true },
		{ "williamboman/mason.nvim", config = true },
	},
})
