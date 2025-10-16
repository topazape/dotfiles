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
---- default
vim.lsp.config("*", {
	root_markers = { ".git" },
})
---- enable each lsp server at lsp directory if exists
vim.iter(vim.api.nvim_get_runtime_file("lsp/*.lua", true))
	:map(function(file)
		return vim.fs.basename(file):match("^(.*)%.lua$")
	end)
	:each(function(server_name)
		vim.lsp.enable(server_name)
	end)
---- enable inlay hints
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		-- skip proxy LSPs
		local proxy_lsps = { "copilot", "basedpyright" }
		local is_proxy = false
		for _, name in ipairs(proxy_lsps) do
			if client.name == name then
				is_proxy = true
			end
		end
		-- enable inlay hints if supported
		if not is_proxy and client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})
