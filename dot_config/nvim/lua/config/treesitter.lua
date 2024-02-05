require("nvim-treesitter.configs").setup({
	sync_install = true,
	auto_install = false,

	ensure_installed = {
		"bash",
		"c",
		"comment",
		"csv",
		"dockerfile",
		"dot",
		"git_config",
		"gitcommit",
		"gitignore",
		"go",
		"hcl",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"regex",
		"ruby",
		"rust",
		"sql",
		"ssh_config",
		"terraform",
		"toml",
		"tsv",
		"typescript",
		"vim",
		"xml",
		"yaml",
	},

	highlight = {
		enable = true,
		disable = {},
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},

	indent = {
		enable = true,
		disable = {
			"yaml",
		},
	},

	-- used by treesitter-rainbow
	rainbow = {
		enable = true,
		disable = {},
	},
})
