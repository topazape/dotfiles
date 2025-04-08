return {
	cmd = { "golangci-lint-langserver" },
	cmd_env = { GOLANGCI_LINT_CACHE = vim.env.XDG_CACHE_HOME .. "/golangci-lint" },
	init_options = {
		command = {
			"golangci-lint",
			"run",
			"--config=~/.config/golangci-lint/config.yml",
			-- "--default=standard",
			-- "--enable=bodyclose,containedctx,errname,errorlint,exhaustive,gocritic,gosec,makezero,misspell,thelper,wsl",
			"--output.json.path=stdout",
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
