return {
	cmd = function(dispatchers, config)
		-- 解決順: project local tsc (typescript@7 stable)
		--       → project local tsgo (@typescript/native-preview)
		--       → global tsc (brew typescript 7.0.2)
		local cmd = "tsc"
		local root = (config or {}).root_dir
		if root then
			for _, name in ipairs({ "tsc", "tsgo" }) do
				local local_cmd = vim.fs.joinpath(root, "node_modules/.bin", name)
				if vim.fn.executable(local_cmd) == 1 then
					cmd = local_cmd
					break
				end
			end
		end
		return vim.lsp.rpc.start({ cmd, "--lsp", "--stdio" }, dispatchers)
	end,

	settings = {
		typescript = {
			inlayHints = {
				parameterNames = {
					enabled = "literals",
					suppressWhenArgumentMatchesName = true,
				},
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_dir = function(bufnr, on_dir)
		local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
		root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
			or vim.list_extend(root_markers, { ".git" })

		local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
		local deno_lock_root = vim.fs.root(bufnr, { "deno.lock" })
		local project_root = vim.fs.root(bufnr, root_markers)
		if deno_lock_root and (not project_root or #deno_lock_root > #project_root) then
			return
		end
		if deno_root and (not project_root or #deno_root >= #project_root) then
			return
		end
		on_dir(project_root or vim.fn.getcwd())
	end,
}
