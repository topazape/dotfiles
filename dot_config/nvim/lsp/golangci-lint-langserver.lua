local command = {
	"golangci-lint",
	"run",
	"--output.json.path=stdout", -- イコール記号を使った形式に変更
	"--issues-exit-code=1",
	"--show-stats=false",
}

-- 設定ファイルが存在する場合のみ追加
if vim.fn.filereadable(vim.env.XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml") == 1 then
	table.insert(command, 2, "--config=" .. vim.env.XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml")
	print(command)
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
