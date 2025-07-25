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
	},
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "recommended", -- off, basic, standard, strict, recommended, all
				diagnosticMode = "workspace",
				diagnosticSeverityOverrides = {
					reportAny = false,
					reportAttributeAccessIssue = false,
					reportCallInDefaultInitializer = false,
					reportExplicitAny = false,
					reportUnknownArgumentType = false,
					reportUnknownMemberType = false,
					reportUnknownVariableType = false,
					reportUnusedImport = false,
					reportUnusedVariable = false,
				},
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
