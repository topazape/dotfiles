return {
	cmd = { "golangci-lint-langserver" },
	cmd_env = {
		GOLANGCI_LINT_CACHE = vim.env.XDG_CACHE_HOME .. "/golangci-lint",
	},

	before_init = function(params, config)
		local root = config.root_dir or params.rootPath or ""
		local env = {}

		-- Go 1.26 では encoding/json/v2 が GOEXPERIMENT でのみ有効
		local goversion = vim.system({ "go", "env", "GOVERSION" }, { cwd = root, text = true }):wait().stdout or ""
		if goversion:match("^go1%.(%d+)") == "26" then
			env.GOEXPERIMENT = "jsonv2"
		end

		-- wrangler プロジェクトは wasm ターゲットなので GOOS/GOARCH を合わせる
		if vim.uv.fs_stat(root .. "/wrangler.toml") or vim.uv.fs_stat(root .. "/wrangler.jsonc") then
			env.GOOS = "js"
			env.GOARCH = "wasm"
		end

		-- golangci-lint-langserver は init_options.command しか受け取らないため、
		-- env(1) を先頭に挿入して lint プロセスに環境変数を渡す
		if next(env) ~= nil then
			local command = { "env" }
			for name, value in pairs(env) do
				table.insert(command, name .. "=" .. value)
			end
			vim.list_extend(command, config.init_options.command)
			config.init_options.command = command
		end
	end,

	init_options = {
		command = {
			"golangci-lint",
			"run",
			"--no-config",
			"--default=standard",
			"--enable=bodyclose,containedctx,errname,errorlint,exhaustive,gocritic,gosec,makezero,misspell,thelper,wsl_v5",
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
		{ ".git" },
	},
}
