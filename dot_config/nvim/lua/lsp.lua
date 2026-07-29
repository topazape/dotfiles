vim.diagnostic.config({
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
	virtual_text = { prefix = "" },
	virtual_lines = false,
})

-- setup lsp
---- enable each lsp server at lsp directory if exists
local servers = vim.tbl_map(function(file)
	return vim.fs.basename(file):match("^(.*)%.lua$")
end, vim.api.nvim_get_runtime_file("lsp/*.lua", true))
vim.lsp.enable(servers)

---- inlayHint
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		-- LSPs that should not have inlay hints enabled
		local skip_inlay_hint_lsps = { "ruff" }
		local should_skip = vim.tbl_contains(skip_inlay_hint_lsps, client.name)

		-- enable inlay hints if not in skip list and supported by the client
		if not should_skip and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})
