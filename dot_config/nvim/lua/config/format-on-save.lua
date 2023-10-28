local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
	formatter_by_ft = {
		go = {
			formatters.shell({ cmd = { "goimports", "-" } }),
			formatters.shell({ cmd = { "gofumpt", "-" } }),
		},
		java = {
			formatters.shell({ cmd = { "google-java-format", "-" } }),
		},
		json = {
			formatters.shell({ cmd = { "jq" } }),
		},
		lua = {
			formatters.stylua, -- default
		},
		python = {
			formatters.shell({ cmd = { "ruff", "format", "--no-cache", "--respect-gitignore", "-" } }),
		},
		rust = {
			formatters.shell({ cmd = { "rustfmt", "--emit=stdout" } }),
		},
		sh = {
			formatters.shfmt, -- default, Google style
		},
		bash = {
			formatters.shfmt, -- default, Google style
		},
		zsh = {
			formatters.shfmt, -- default, Google style
		},

		toml = {
			formatters.shell({ cmd = { "taplo", "format", "-" } }),
		},
		yaml = {
			formatters.shell({ cmd = { "yamlfmt", "-" } }),
		},
		fallback_formatter = {
			formatters.remove_trailing_whitespace,
		},
	},
})
