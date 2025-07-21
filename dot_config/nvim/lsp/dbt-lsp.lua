return {
	cmd = { "dbt-lsp", "--socket", "3333" },
	filetypes = { "sql", "yaml" },
	root_markers = {
		"dbt_project.yml",
	},
}
