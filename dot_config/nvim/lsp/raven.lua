return {
	cmd = { "raven", "--stdio" },
	init_options = {
		packages = {
			additionalLibraryPaths = {
				"rv",
			},
		},
	},
	filetypes = { "r" },
	root_markers = { "raven.toml", "rproject.toml", ".git" },
}
