require("nvim-treesitter.configs").setup({
	sync_install = true,
	auto_install = false,

	ensure_installed = {
		"bash",
		"comment",
		"css",
		"csv",
		"dockerfile",
		"dot",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"gomod",
		"gosum",
		"hcl",
		"html",
		"javascript",
		"json",
		"latex",
		"lua",
		"luadoc",
		"make",
		"markdown",
		"markdown_inline",
		"pip_requirements",
		"python",
		"r",
		"regex",
		"ruby",
		"rust",
		"sql",
		"ssh_config",
		"terraform",
		"toml",
		"tsv",
		"typescript",
		"typst",
		"vim",
		"vimdoc",
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
})
