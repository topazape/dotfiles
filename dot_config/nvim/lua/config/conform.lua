local conform = require("conform")

conform.setup({
	format_on_save = {
		timeout_ms = 500,
		-- lsp_format = "fallback",
	},
	formatters_by_ft = {
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
		["*"] = {
			"trim_newlines",
			"trim_whitespace",
		},
	},
})
