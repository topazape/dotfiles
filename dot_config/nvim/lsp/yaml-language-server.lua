return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = require("schemastore").yaml.schemas({
				replace = {
					["Argo Events"] = {
						description = "Argo Events Event Sources and Sensors",
						fileMatch = { "**/*manifest*/**/*.yml" },
						name = "Argo Events",
						url = "https://raw.githubusercontent.com/argoproj/argo-events/master/api/jsonschema/schema.json",
					},
					["Argo Workflows"] = {
						description = "Argo Workflow configuration file",
						fileMatch = { "**/*manifest*/**/*.yml" },
						name = "Argo Workflows",
						url = "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json",
					},
				},
			}),
		},
	},
}
