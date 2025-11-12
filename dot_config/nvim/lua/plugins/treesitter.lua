return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		sync_install = false,
		auto_install = false,

		highlight = {
			enable = true,
			disable = {},
			additional_vim_regex_highlighting = true,
		},

		indent = {
			enable = true,
			disable = {
				"yaml",
			},
		},

		ensure_installed = "all",
	},
}
