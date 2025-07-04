return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"Pipfile",
		"pyproject.toml",
		"pyrightconfig.json",
		"requirements.txt",
		"setup.cfg",
		"setup.py",
		".git",
	},
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "off", -- off, basic, standard, strict, recommended, all
				diagnosticMode = "workspace",
				inlayHints = {
					callArgumentNames = false,
					functionReturnTypes = false,
					genericTypes = true,
					variableTypes = true,
				},
			},
		},
	},
}
