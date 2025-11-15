return {
	cmd = { "golangci-lint-langserver" },
	init_options = {
		command = {
			"golangci-lint",
			"run",
			"--no-config",
			"--default=standard",
			"--enable=bodyclose,containedctx,errname,errorlint,exhaustive,gocritic,gosec,makezero,misspell,theper,wsl",
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
		".git",
	},
}
