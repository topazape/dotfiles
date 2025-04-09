return {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "terraform-vars", "hcl" },
	init_options = {
		ignoreSingleFileWarning = true,
	},
	root_markers = { ".terraform", "git" },
}
