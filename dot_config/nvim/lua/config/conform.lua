local conform = require("conform")

conform.setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		css = {
			"prettier",
		},
		bash = {
			"shfmt",
		},
		go = {
			"goimports",
			"gofumpt",
		},
		html = {
			"prettier",
		},
		javascript = {
			"prettier",
		},
		json = {
			"prettier",
		},
		lua = {
			"stylua",
		},
		markdown = {
			"prettier",
		},
		python = {
			"ruff_organize_imports",
			"ruff_format",
		},
		sh = {
			"shfmt",
		},
		toml = {
			"taplo",
		},
		yaml = {
			"prettier",
		},
		zsh = {
			"shfmt",
		},

		["*"] = {
			"trim_newlines",
			"trim_whitespace",
		},
	},
})
