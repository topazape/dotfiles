local command

if vim.fn.executable("golangci-lint-langserver") == 1 then
	command = {
		"golangci-lint",
		"--config",
		vim.env.XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml",
		"run",
		"--output.json.path",
		"stdout",
		"--issues-exit-code=1",
		"--show-stats=false",
	}
else
	command = {
		"golangci-lint",
		"run",
		"--output.json.path",
		"stdout",
		"--issues-exit-code=1",
		"--show-stats=false",
	}
end

return {
	cmd = { "golangci-lint-langserver" },
	cmd_env = { GOLANGCI_LINT_CACHE = vim.env.XDG_CACHE_HOME .. "/golangci-lint" },
	init_options = {
		command = command,
	},
	filetypes = { "go", "gomod" },
	root_markers = {
		".golangci.yml",
		".golangci.yaml",
		".golangci.toml",
		".golangci.json",
		"go.work",
		"go.mod",
	},
}
