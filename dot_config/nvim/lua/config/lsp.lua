require("mason").setup()
require("mason-lspconfig").setup()

-- xdg config dir
local XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME")
if not XDG_CONFIG_HOME then
	XDG_CONFIG_HOME = os.getenv("HOME") .. "/.config"
end
-- xdg cache dir
local XDG_CACHE_HOME = os.getenv("XDG_CACHE_HOME")
if not XDG_CACHE_HOME then
	XDG_CACHE_HOME = os.getenv("HOME") .. "/.cache"
end

-- lua path (https://zenn.dev/uga_rosa/articles/afe384341fc2e1)
---@param names string[]
---@return string[]
local function get_plugin_paths(names)
	local plugins = require("lazy.core.config").plugins
	local paths = {}
	for _, name in ipairs(names) do
		if plugins[name] then
			table.insert(paths, plugins[name].dir)
		else
			vim.notify("Invalid plugin name: " .. name)
		end
	end
	return paths
end

---@param plugins string[]
---@return string[]
local function library(plugins)
	local paths = get_plugin_paths(plugins)
	table.insert(paths, vim.fn.stdpath("config"))
	table.insert(paths, vim.env.VIMRUNTIME)
	table.insert(paths, "${3rd}/luv/library")
	table.insert(paths, "${3rd}/busted/library")
	table.insert(paths, "${3rd}/luassert/library")
	return paths
end

-- python path
local py_path = vim.fn.exepath("python3")
if os.getenv("VIRTUAL_ENV") ~= nil then
	py_path = os.getenv("VIRTUAL_ENV") .. "/bin/python3"
elseif vim.g.python3_host_prog ~= nil then
	py_path = vim.g.python3_host_prog
end

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
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						library = library({ "lazy.nvim" }),
						checkThirdParty = false,
					},
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
						-- jedi
						jedi_completion = { enabled = true },
						jedi_definition = { enabled = true },
						jedi_hover = { enabled = true },
						jedi_references = { enabled = true },
						jedi_signature_help = { enabled = true },
						jedi_symbols = { enabled = true },
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
							report_progress = true,
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

	["gopls"] = function()
		vim.env.GOPLSCACHE = XDG_CACHE_HOME .. "/gopls"
		require("lspconfig").gopls.setup({
			settings = {
				gopls = {
					hints = {
						rangeVariableTypes = true,
						parameterNames = true,
						constantValues = true,
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						functionTypeParameters = true,
					},
				},
			},
		})
	end,

	["golangci_lint_ls"] = function()
		vim.env.GOLANGCI_LINT_CACHE = XDG_CACHE_HOME .. "/golangci-lint"

		local golangci_lint_command = { "golangci-lint", "run", "--fix=false", "--out-format", "json" }
		if vim.fn.filereadable(XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml") == 1 then
			golangci_lint_command = {
				"golangci-lint",
				"run",
				"--fix=false",
				"--out-format",
				"json",
				"--config",
				XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml",
			}
		end
		require("lspconfig").golangci_lint_ls.setup({
			init_options = {
				command = golangci_lint_command,
			},
		})
	end,

	["rust_analyzer"] = function()
		require("lspconfig").rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
				},
			},
		})
	end,

	["tinymist"] = function()
		require("lspconfig").tinymist.setup({
			settings = {
				exportPdf = "never",
				formatterMode = "typstyle",
			},
		})
	end,

	["terraformls"] = function()
		require("lspconfig").terraformls.setup({
			filetypes = { "terraform", "terraform-vars", "hcl" },
		})
	end,
}

require("mason-lspconfig").setup_handlers(handlers)
