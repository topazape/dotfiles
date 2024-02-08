local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

-- xdg config dir
local XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME")
if not XDG_CONFIG_HOME then
	XDG_CONFIG_HOME = os.getenv("HOME") .. "/.config"
end
-- xdg cache dir
local XDG_CACHE_HOME = os.getenv("XDG_CACHE_HOME")
if not XDG_CACHE_HOME then
	XDG_CACHE_HOME = os.getenv("HOME") .. "/.cache"
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

vim.env.GOLANGCI_LINT_CACHE = XDG_CACHE_HOME .. "/golangci-lint"
local golangci_lint_cmd = { "golangci-lint", "run", "--fix", "--allow-parallel-runners=false" }
if vim.fn.filereadable(XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml") == 1 then
	golangci_lint_cmd = {
		"golangci-lint",
		"run",
		"--fix",
		"--allow-parallel-runners=false",
		"--config",
		XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml",
	}
end

format_on_save.setup({
	formatter_by_ft = {
		go = {
			formatters.shell({ cmd = golangci_lint_cmd }),
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
			formatters.shell({ cmd = { "yamlfmt", "%" } }),
		},
		fallback_formatter = {
			formatters.remove_trailing_whitespace,
			formatters.remove_trailing_newlines,
		},
	},
})
