return {
	cmd = {
		"R",
		"--no-echo",
		"-e",
		"options(lintr.linter_file='" .. vim.fn.stdpath("config") .. "/lsp/lintr.dcf'); languageserver::run()",
	},
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
