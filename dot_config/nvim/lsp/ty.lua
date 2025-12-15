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
		ty = {
			diagnosticMode = "workspace",

			inlayHints = {
				variableTypes = true,
				callArgumentNames = true,
			},

			completions = {
				autoImport = true,
			},
		},
	},
}
