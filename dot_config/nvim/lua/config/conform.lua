local conform = require("conform")

conform.setup({
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
	formatters = {
		["sqlfluff"] = {
			require_cwd = false,
		},
		["golangci-lint"] = {
			args = { "--config", vim.env.XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml", "fmt", "--stdin" },
		},
	},
	formatters_by_ft = {
		r = {
			"air",
		},
		css = {
			"prettier",
		},
		bash = {
			"shfmt",
		},
		dbt = {
			"sqlfmt",
		},
		fish = {
			"fish_indent",
		},
		go = {
			"golangci-lint",
		},
		hcl = {
			"hcl",
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
		sql = {
			"sqlfluff",
		},
		terraform = {
			"hcl",
		},
		toml = {
			"taplo",
		},
		typescript = {
			"prettier",
		},
		xml = {
			"xmlformatter",
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
