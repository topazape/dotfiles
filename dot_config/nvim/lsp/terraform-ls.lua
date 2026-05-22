return {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "terraform-vars" },
	init_options = {
		ignoreSingleFileWarning = true,
	},
	root_markers = { ".terraform.lock.hcl", "versions.tf" },
}
