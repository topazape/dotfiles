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
		-- python = {
		-- 	pythonPath = "./.venv/bin/python",
		-- },
		basedpyright = {
			analysis = {
				typeCheckingMode = "recommended", -- off, basic, standard, strict, recommended, all
				diagnosticMode = "workspace",
				diagnosticSeverityOverrides = {
					reportAny = false,
					reportExplicitAny = false,
					reportCallInDefaultInitializer = false,
					reportUnusedImport = false,
					reportUnusedVariable = false,
					reportAttributeAccessIssue = false,
					reportUnknownArgumentType = false,
					reportUnknownMemberType = false,
					reportUnknownVariableType = false,
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
