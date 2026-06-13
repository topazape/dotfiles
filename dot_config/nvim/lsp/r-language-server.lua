return {
	cmd = { "R", "--no-echo", "-e", "languageserver::run()" },
	cmd_env = {
		R_LINTR_LINTER_FILE = vim.fn.stdpath("config") .. "/lsp/lintr.dcf",
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
