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

local function clients_for(names)
	if #names == 0 then
		return vim.lsp.get_clients({ bufnr = 0 })
	end
	local out = {}
	for _, name in ipairs(names) do
		vim.list_extend(out, vim.lsp.get_clients({ name = name }))
	end
	return out
end

vim.api.nvim_create_user_command("LspRestart", function(cmd)
	local clients = clients_for(cmd.fargs)

	for _, client in ipairs(clients) do
		client:_restart()
	end

	if #clients == 0 then
		vim.cmd.doautoall("nvim.lsp.enable FileType")
	end
end, {
	nargs = "*",
	desc = "Restart LSP clients attached to the current buffer",
	complete = function(arg)
		local names = vim.tbl_keys(vim.lsp._enabled_configs or {})
		return vim.tbl_filter(function(n)
			return n:find(arg, 1, true) == 1
		end, names)
	end,
})
