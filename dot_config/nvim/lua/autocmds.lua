local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- 拡張子を元にファイルタイプを設定する
---- *.bq は SQL ファイルとして扱う
autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.bq" },
	command = "setfiletype sql",
})
---- *.tf は Terraform ファイルとして扱う
autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.tf" },
	command = "setfiletype terraform",
})
---- *.golden は JSON ファイルとして扱う
autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.golden" },
	command = "setfiletype json",
})

-- ファイルタイプ別設定
---- dbt
autocmd({ "FileType" }, {
	pattern = { "dbt" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = true
	end,
})

---- go
autocmd({ "FileType" }, {
	pattern = { "go" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 0
		vim.opt_local.expandtab = false
	end,
})
---- html
autocmd({ "FileType" }, {
	pattern = { "html" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
---- lua
autocmd({ "FileType" }, {
	pattern = { "lua" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
---- makefile
autocmd({ "FileType" }, {
	pattern = { "makefile", "Makefile" },
	callback = function()
		vim.opt_local.tabstop = 8
		vim.opt_local.shiftwidth = 8
		vim.opt_local.softtabstop = 0
		vim.opt_local.expandtab = false
	end,
})
---- rust
autocmd({ "FileType" }, {
	pattern = { "rust" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = true
	end,
})
---- sh (Google Shell Style Guide)
autocmd({ "FileType" }, {
	pattern = { "sh", "bash", "zsh" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
---- fish
autocmd({ "FileType" }, {
	pattern = { "fish" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = true
	end,
})
---- java
autocmd({ "FileType" }, {
	pattern = { "java" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = true
	end,
})
---- sql
autocmd({ "FileType" }, {
	pattern = { "sql" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 4
		vim.opt_local.expandtab = true
	end,
})
---- terraform, hcl
autocmd({ "FileType" }, {
	pattern = { "terraform", "hcl" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
---- json, yaml, toml
autocmd({ "FileType" }, {
	pattern = { "json", "yaml", "yml", "toml" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
---- typst
autocmd({ "FileType" }, {
	pattern = { "typst" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
		vim.keymap.set("n", "<LEADER>pr", "<CMD>TypstPreviewToggle<CR>", { noremap = true, silent = true })
	end,
})
---- octo
autocmd({ "FileType" }, {
	pattern = { "octo" },
	callback = function()
		vim.bo.filetype = "markdown"
	end,
})
---- xml
autocmd({ "FileType" }, {
	pattern = { "xml" },
	callback = function()
		vim.opt_local.foldmethod = "expr"
		vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt_local.foldlevel = 3
		vim.opt_local.foldtext =
			[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))]]

		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

-- ターミナルモード
---- 常にインサートモードで開く
autocmd({ "TermOpen" }, {
	pattern = { "*" },
	command = "startinsert",
})
---- 行番号を表示させない
autocmd({ "TermOpen" }, {
	pattern = { "*" },
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.signcolumn = "no"
	end,
})
