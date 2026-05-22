return {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "terraform-vars" },
	init_options = {
		ignoreSingleFileWarning = true,
	},
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
	root_markers = { ".terraform.lock.hcl", "versions.tf" },
}
