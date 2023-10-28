-- mason
require("mason").setup()

-- mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup()

mason_lspconfig.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn"t have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
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
			filetypes = { "sh", "bash", "zsh" },
		})
	end,
	["golangci_lint_ls"] = function()
		require("lspconfig").golangci_lint_ls.setup({
			init_options = {
				command = {
					"golangci-lint",
					"run",
					"--enable",
					"gofumpt",
					"--enable",
					"goimports",
					"--out-format",
					"json",
					"--issues-exit-code=1",
				},
			},
		})
	end,
})
