local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	-- navic
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	-- Mappings.
	local bufopts = { noremap = true, buffer = bufnr }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.rename)
	vim.keymap.set("n", "ge", vim.diagnostic.open_float)
	vim.keymap.set("n", "g]", vim.diagnostic.goto_next)
	vim.keymap.set("n", "g[", vim.diagnostic.goto_prev)
end

-- mason
local mason = require("mason")
mason.setup()

-- mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup()

mason_lspconfig.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn"t have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
		})
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
	["pylsp"] = function()
		require("lspconfig").pylsp.setup({
			on_attach = on_attach,
			settings = {
				pylsp = {
					plugins = {
						-- python-lsp-server[all] plugins will be disabled
						autopep8 = { enabled = false },
						flake8 = { enabled = false },
						mccabe = { enabled = false },
						preload = { enabled = false },
						pycodestyle = { enabled = false },
						pydocstyle = { enabled = false },
						pyflakes = { enabled = false },
						pylint = { enabled = false },
						rope_autocomplete = { enabled = false },
						rope_completion = { enabled = false },
						yapf = { enabled = false },
						-- 3rd-party plugins
						mypy = { enabled = true },
					},
				},
			},
		})
	end,
	["bashls"] = function()
		require("lspconfig").bashls.setup({
			on_attach = on_attach,
			filetypes = { "sh", "bash", "zsh" },
		})
	end,
})
