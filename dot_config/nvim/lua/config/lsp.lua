require("mason").setup()
require("mason-lspconfig").setup()

local py_path = nil
if vim.fn.executable("pylsp") then
	local venv_path = os.getenv("VIRTUAL_ENV")
	if venv_path ~= nil then
		py_path = venv_path .. "/bin/python3"
	elseif vim.g.python3_host_prog ~= nil then
		py_path = vim.g.python3_host_prog
	else
		py_path = vim.fn.exepath("python3")
	end
end

local handlers = {
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
						---- type checker
						pylsp_mypy = {
							enabled = true,
							overrides = { "--python-executable", py_path, true },
						},
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
}

require("mason-lspconfig").setup_handlers(handlers)
