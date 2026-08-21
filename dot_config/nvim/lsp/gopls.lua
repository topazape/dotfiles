return {
	cmd = { "gopls" },
	cmd_env = { GOPLSCACHE = vim.env.XDG_CACHE_HOME .. "/gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = {
		"go.work",
		"go.mod",
		".git",
	},

	before_init = function(_, config)
		local root = config.root_dir
		if not root then
			return
		end

		local env = {}
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
