return {
	cmd = { "dbt-lsp", "--socket", "/tmp/socket" },
	filetypes = { "sql", "yaml" },
	root_markers = {
		"dbt_project.yml",
	},
}
