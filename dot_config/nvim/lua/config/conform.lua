local conform = require("conform")
print("conform loaded")

conform.setup({
	format_on_save = {
		lsp_format = "first",
	},
	formatters_by_ft = {
		["*"] = {
			"trim_newlines",
			"trim_whitespace",
		},
		go = {
			"goimports",
			"gofumpt",
		},
		lua = {
			"stylua",
		},
		python = {
			"ruff_organize_imports",
			"ruff_format",
		},
		rust = {
			"rustfmt",
		},
		sh = {
			"shfmt",
		},
		bash = {
			"shfmt",
		},
		zsh = {
			"shfmt",
		},
		json = {
			"prettier",
		},
		toml = {
			"taplo",
		},
		yaml = {
			"prettier",
		},
		markdown = {
			"prettier",
		},
	},
})
