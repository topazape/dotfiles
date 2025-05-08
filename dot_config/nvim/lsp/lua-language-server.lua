return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
	},
	settings = {
		Lua = {
			codeLens = {
				enable = true,
			},
			completion = {
				autoRequire = false,
				callSnippet = "Replace",
				keywordSnippet = "Both",
				workspaceWord = true,
			},
			diagnostics = {
				disable = {
					"inject-field",
					"missing-fields",
					"missing-parameter",
				},
				globals = {
					"LazyVim",
					"Snacks",
					"bit",
					"colors",
					"defaults",
					"describe",
					"ev",
					"hl",
					"it",
					"keys",
					"math",
					"ns",
					"package",
					"require",
					"vim",
				},
				unusedLocalExclude = {
					"_*",
				},
			},
			doc = {
				privateName = { "^_" },
			},
			format = {
				enable = false,
			},
			hint = {
				arrayIndex = "Disable",
				enable = true,
				paramName = "Disable",
				paramType = true,
				semicolon = "Disable",
				setType = true,
			},
			hover = {
				expandAlias = false,
			},
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME .. "/lua",
				},
			},
			telemetry = {
				enable = false,
			},
			type = {
				castNumberToInteger = true,
				inferParamType = true,
				checkTableShape = true,
			},
		},
	},
}
