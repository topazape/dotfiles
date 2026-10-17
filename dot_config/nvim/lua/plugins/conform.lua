return {
	"stevearc/conform.nvim",

	opts = {
		default_format_opts = {
			timeout_ms = 3000,
			lsp_format = "fallback",
		},
		format_on_save = {},
		formatters = {
			["sqlfluff"] = {
				require_cwd = false,
			},
			["golangci-lint"] = {
				append_args = { "--no-config", "--enable=gofumpt,goimports" },
			},
			["arity"] = {
				command = "arity",
				args = { "format", "--stdin-filename", "$FILENAME", "-" },
				stdin = true,
			},
		},
		formatters_by_ft = {
			bash = {
				"shfmt",
			},
			css = {
				"prettier",
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
			jsonc = {
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
			r = {
				"arity",
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
				"tombi",
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
			["_"] = {
				"trim_newlines",
				"trim_whitespace",
				lsp_format = "last",
			},
		},
	},
}
