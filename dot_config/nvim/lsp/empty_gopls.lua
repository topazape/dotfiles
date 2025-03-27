return {
	cmd = { "gopls" },
	cmd_env = { GOPLSCACHE = vim.env.XDG_CACHE_HOME .. "/gopls" },
	root_markers = { "go.mod" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		gopls = {
			analyses = {
				fillstruct = true,
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
