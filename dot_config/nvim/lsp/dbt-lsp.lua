return {
	cmd = { "dbt-lsp", "--socket", "~/.socket" },
	filetypes = { "sql", "yaml" },
	root_markers = {
		"dbt_project.yml",
	},
}
