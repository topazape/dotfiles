return {
	cmd = { "R", "--no-echo", "-e", "languageserver::run()" },
	filetypes = { "r" },
	root_markers = { "DESCRIPTION", "renv.lock", "rproject.toml" },
	settings = {
		r = {
			lsp = {
				server_capabilities = {
					documentFormattingProvider = false,
					documentRangeFormattingProvider = false,
				},
			},
		},
	},
}
