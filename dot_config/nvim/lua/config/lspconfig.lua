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

local lspconfig = require("lspconfig")
require("lspconfig.configs").sqruff = {
	default_config = {
		cmd = { "sqruff", "lsp" },
		filetypes = { "sql" },
	},
}

local handlers = {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn"t have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup({})
	end,

	-- Next, you can provide a dedicated handler for specific servers.
	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
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

	["basedpyright"] = function()
		lspconfig.basedpyright.setup({
			settings = {
				python = {
					pythonPath = "./.venv/bin/python",
				},
				basedpyright = {
					analysis = {
						typeCheckingMode = "recommended", -- off, basic, standard, strict, recommended, all
						diagnosticMode = "workspace",
						diagnosticSeverityOverrides = {
							reportAny = false,
							reportExplicitAny = false,
							reportUnusedImport = false,
							reportUnusedVariable = false,
							reportAttributeAccessIssue = false,
							reportUnknownArgumentType = false,
							reportUnknownMemberType = false,
							reportUnknownVariableType = false,
						},
						inlayHints = {
							callArgumentNames = false,
							functionReturnTypes = false,
							genericTypes = true,
							variableTypes = true,
						},
					},
				},
			},
		})
	end,

	["bashls"] = function()
		lspconfig.bashls.setup({
			filetypes = { "sh", "bash", "zsh" },
		})
	end,

	["gopls"] = function()
		vim.env.GOPLSCACHE = XDG_CACHE_HOME .. "/gopls"
		lspconfig.gopls.setup({
			settings = {
				gopls = {
					analyses = {
						fillstruct = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = false,
						rangeVariableTypes = true,
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
		lspconfig.golangci_lint_ls.setup({
			init_options = {
				command = golangci_lint_command,
			},
		})
	end,

	["rust_analyzer"] = function()
		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
					},
					inlayHints = {
						bindingModeHints = {
							enable = false,
						},
						chainingHints = {
							enable = true,
						},
						closingBraceHints = {
							enable = true,
							minLines = 25,
						},
						closureReturnTypeHints = {
							enable = "never",
						},
						lifetimeElisionHints = {
							enable = "never",
							useParameterNames = false,
						},
						maxLength = 25,
						parameterHints = {
							enable = true,
						},
						reborrowHints = {
							enable = "never",
						},
						renderColons = true,
						typeHints = {
							enable = true,
							hideClosureInitialization = false,
							hideNamedConstructor = false,
						},
					},
				},
			},
		})
	end,

	["tinymist"] = function()
		lspconfig.tinymist.setup({
			settings = {
				exportPdf = "never",
				formatterMode = "typstyle",
			},
		})
	end,

	["terraformls"] = function()
		lspconfig.terraformls.setup({
			filetypes = { "terraform", "terraform-vars", "hcl" },
		})
	end,

	["sqruff"] = function()
		lspconfig.sqruff.setup({})
	end,
}

require("mason-lspconfig").setup_handlers(handlers)
