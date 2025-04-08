return {
	cmd = { "golangci-lint-langserver" },
	cmd_env = { GOLANGCI_LINT_CACHE = vim.env.XDG_CACHE_HOME .. "/golangci-lint" },
	init_options = {
		command = {
			"golangci-lint",
			"run",
			"--config",
			vim.env.XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml",
			"--output.json.path",
			"stdout",
			"--issues-exit-code=1",
			"--show-stats=false",
		},
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
