require("nvim-treesitter.configs").setup({
	sync_install = false,
	auto_install = false,

	highlight = {
		enable = true,
		disable = {},
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
		disable = {
			"yaml",
		},
	},

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
		"nix",
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
})
