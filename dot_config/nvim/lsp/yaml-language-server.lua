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
				["Argo Events"] = {
					fileMatch = { "**/*manifest*/**/*.yml" },
				},
				["Argo Workflows"] = {
					fileMatch = { "**/*manifest*/**/*.yml" },
				},
			}),
		},
	},
}
