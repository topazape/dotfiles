local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

-- xdg config dir
local XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME")
if not XDG_CONFIG_HOME then
	XDG_CONFIG_HOME = os.getenv("HOME") .. "/.config"
end

local ruff_cmd = { "ruff", "format", "--no-cache", "--respect-gitignore", "-" }
if vim.fn.filereadable(XDG_CONFIG_HOME .. "/ruff/ruff.toml") == 1 then
	ruff_cmd = {
		"ruff",
		"format",
		"--config",
		XDG_CONFIG_HOME .. "/ruff/ruff.toml",
		"--no-cache",
		"--respect-gitignore",
		"-",
	}
end

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
			formatters.shell({ cmd = { "isort", "-" } }),
			formatters.shell({ cmd = ruff_cmd }),
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
		terraform = {
			formatters.lsp,
		},
		hcl = {
			formatters.lsp,
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
			formatters.shell({ cmd = { "yamlfmt", "-" } }),
		},
		fallback_formatter = {
			formatters.remove_trailing_whitespace,
			formatters.remove_trailing_newlines,
		},
	},
})
