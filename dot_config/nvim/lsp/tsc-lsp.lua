---@type vim.lsp.Config
return {
	-- TS 7.0 以降は typescript パッケージ同梱の tsc が LSP を実装（tsc --lsp --stdio）。
	-- ローカル資産の node_modules/.bin/tsc を優先し、なければ PATH 上の tsc に fallback。
	-- ローカル解決に root_dir が必要なため、静的テーブルでなく関数にしている。
	cmd = function(dispatchers, config)
		local bin = "tsc"
		if (config or {}).root_dir then
			local local_bin = vim.fs.joinpath(config.root_dir, "node_modules/.bin", bin)
			if vim.fn.executable(local_bin) == 1 then
				bin = local_bin
			end
		end
		return vim.lsp.rpc.start({ bin, "--lsp", "--stdio" }, dispatchers)
	end,

	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},

	-- monorepo を単一プロセスで扱うため、tsconfig.json ではなく
	-- package manager の lockfile をプロジェクトルートとする（upstream tsgo.lua と同方針）。
	-- 内側テーブルは同一優先度、.git は最後の fallback（nvim 0.11.3+ の記法）。
	root_markers = {
		{
			"package-lock.json",
			"yarn.lock",
			"pnpm-lock.yaml",
			"bun.lockb",
			"bun.lock",
		},
		{ ".git" },
	},

	settings = {
		typescript = {
			inlayHints = {
				-- gopls の parameterNames = false に合わせて無効化（upstream 既定は "literals"）
				parameterNames = {
					enabled = "none",
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
}
