return {
	cmd = { "gopls" },
	cmd_env = { GOPLSCACHE = vim.env.XDG_CACHE_HOME .. "/gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = {
		"go.work",
		"go.mod",
		{ ".git" },
	},

	before_init = function(params, config)
		local root = params.rootPath or ""
		local env = {}

		-- Go の minor version を取得し、1.26 の場合に encoding/json/v2 を有効にする
		local goversion = vim.system({ "go", "env", "GOVERSION" }, { cwd = root, text = true }):wait().stdout or ""
		if goversion:match("^go1%.(%d+)") == "26" then
			env.GOEXPERIMENT = "jsonv2"
		end

		-- wrangler プロジェクトは wasm ターゲットなので GOOS/GOARCH を合わせる
		if vim.uv.fs_stat(root .. "/wrangler.toml") or vim.uv.fs_stat(root .. "/wrangler.jsonc") then
			env.GOOS = "js"
			env.GOARCH = "wasm"
		end

		if next(env) ~= nil then
			config.settings.gopls.env = env
		end
	end,

	settings = {
		gopls = {
			analyses = {
				fillstruct = true,
				stdversion = false,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = false,
				rangeVariableTypes = true,
			},
		},
	},
}
