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
	-- virtual_text = {
	-- 	prefix = "",
	-- },
	virtual_text = false,
	virtual_lines = true,
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
