local conform = require("conform")

conform.setup({
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
	formatters = {
		sqlfluff = {
			command = "sqlfluff",
			args = { "format", "-" },
			cwd = (function()
				local f = require("conform.util").root_file({ ".git", ".sqlfluff" })
				return function()
					local dir = f()
					local final = dir or vim.fn.getcwd()
					print("formatter cwd = " .. final)
					return final
				end
			end)(),
		},
	},
	formatters_by_ft = {
		css = {
			"prettier",
		},
		bash = {
			"shfmt",
		},
		html = {
			"prettier",
		},
		javascript = {
			"prettier",
		},
		json = {
			"prettier",
		},
		lua = {
			"stylua",
		},
		markdown = {
			"prettier",
		},
		python = {
			"ruff_organize_imports",
			"ruff_format",
		},
		sh = {
			"shfmt",
		},
		sql = {
			"sqlfluff",
		},
		toml = {
			"taplo",
		},
		typescript = {
			"prettier",
		},
		xml = {
			"xmlformatter",
		},
		yaml = {
			"prettier",
		},
		zsh = {
			"shfmt",
		},
		["*"] = {
			"trim_newlines",
			"trim_whitespace",
		},
	},
})
