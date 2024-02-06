local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
	formatter_by_ft = {
		go = {
			formatters.shell({ cmd = { "goimports" } }),
			formatters.shell({ cmd = { "gofumpt" } }),
		},
		lua = {
			formatters.stylua, -- default
		},
		python = {
			formatters.ruff, --default
			formatters.shell({ cmd = { "isort", "-" } }),
		},
		rust = {
			formatters.lsp,
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
		dockerfile = {
			formatters.lsp,
		},
		json = {
			formatters.shell({ cmd = { "jq", "." } }),
		},
		toml = {
			formatters.shell({ cmd = { "taplo", "format", "-" } }),
		},
		yaml = {
			formatters.lsp,
		},
		fallback_formatter = {
			formatters.remove_trailing_whitespace,
		},
	},
})
