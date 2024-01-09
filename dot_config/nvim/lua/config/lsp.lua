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

-- lua (https://zenn.dev/uga_rosa/articles/afe384341fc2e1)
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
						library = library({ "lazy.nvim", "nvim-insx" }),
						checkThirdParty = false,
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,

	["pyright"] = function()
		require("lspconfig").pyright.setup({
			-- https://github.com/microsoft/pyright/blob/main/docs/settings.md
			settings = {
				python = {
					analysis = {
						autoImportCompletions = true,
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						typeCheckingMode = "strict",
						useLibraryCodeForTypes = true,
					},
				},
			},
		})
	end,

	["ruff_lsp"] = function()
		local ruff_args = {}
		if vim.fn.filereadable(XDG_CONFIG_HOME .. "/ruff/ruff.toml") == 1 then
			ruff_args = { "--config", XDG_CONFIG_HOME .. "/ruff/ruff.toml" }
		end
		require("lspconfig").ruff_lsp.setup({
			init_options = {
				settings = {
					args = ruff_args,
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
		require("lspconfig").gopls.setup({})
		vim.env.GOPLSCACHE = XDG_CACHE_HOME .. "/gopls"
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
		vim.env.GOLANGCI_LINT_CACHE = XDG_CACHE_HOME .. "/golangci-lint"
	end,
}

require("mason-lspconfig").setup_handlers(handlers)
