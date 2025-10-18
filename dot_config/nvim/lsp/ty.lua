return {
	cmd = { "ty", "server" },
	filetypes = { "python" },
	root_markers = {
		"Pipfile",
		"pyproject.toml",
		"pyrightconfig.json",
		"requirements.txt",
		"setup.cfg",
		"setup.py",
		"ty.toml",
	},
	settings = {
		diagnosticMode = "workspace",
		ty = {
			experimental = {
				rename = true,
				autoImport = true,
			},
			inlayHints = {
				variableTypes = true,
				callArgumentNames = true,
			},
		},
	},
}
