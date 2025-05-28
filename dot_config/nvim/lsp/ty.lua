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
	},
	init_options = {
		settings = {
			ty = {
				experimental = {
					completions = {
						enable = true,
					},
				},
			},
		},
	},
}
