require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"dockerfile",
		"go",
		"java",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"regex",
		"rust",
		"terraform",
		"toml",
		"vim",
		"yaml",
	},
	sync_install = false,
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	rainbow = {
		enable = true,
	},
})
