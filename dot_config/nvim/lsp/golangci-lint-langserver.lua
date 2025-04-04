return {
	cmd = { "golangci-lint-langserver" },
	cmd_env = { GOLANGCI_LINT_CACHE = vim.env.XDG_CACHE_HOME .. "/golangci-lint" },
	init_options = {
		command = (function()
			if vim.fn.filereadable(vim.env.XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml") == 1 then
				return {
					"golangci-lint",
					"run",
					"--output.json.path=stdout",
					"--show-stats=false",
					"--config",
					vim.env.XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml",
				}
			end
			return { "golangci-lint", "run", "--output.json.path=stdout", "--show-stats=false" }
		end)(),
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
