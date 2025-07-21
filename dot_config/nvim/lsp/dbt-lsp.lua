return {
	cmd = { "dbt-lsp", "--socket", "99999" },
	filetypes = { "sql", "yaml" },
	root_markers = {
		"dbt_project.yml",
	},
}
