local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

local group = augroup("user_autocmds", { clear = true })

-- 拡張子を元にファイルタイプを設定する
vim.filetype.add({
	extension = {
		bq = "sql", -- *.bq は SQL ファイルとして扱う
		golden = "json", -- *.golden は JSON ファイルとして扱う
		tf = "terraform", -- *.tf は Terraform ファイルとして扱う
	},
})

-- ファイルタイプ別設定
---- r
autocmd({ "FileType" }, {
	group = group,
	pattern = { "r", "rmd", "rnoweb", "rrst" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

---- dbt
autocmd({ "FileType" }, {
	group = group,
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
	group = group,
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
	group = group,
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
	group = group,
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
	group = group,
	pattern = { "make" },
	callback = function()
		vim.opt_local.tabstop = 8
		vim.opt_local.shiftwidth = 8
		vim.opt_local.softtabstop = 0
		vim.opt_local.expandtab = false
	end,
})
---- rust
autocmd({ "FileType" }, {
	group = group,
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
	group = group,
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
	group = group,
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
	group = group,
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
	group = group,
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
	group = group,
	pattern = { "terraform", "hcl" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
---- json, jsonc, yaml, toml
autocmd({ "FileType" }, {
	group = group,
	pattern = { "json", "jsonc", "yaml", "toml" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
---- typst
autocmd({ "FileType" }, {
	group = group,
	pattern = { "typst" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
		vim.keymap.set("n", "<leader>pr", "<cmd>TypstPreviewToggle<cr>", { buffer = true, silent = true })
	end,
})
---- xml
autocmd({ "FileType" }, {
	group = group,
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
	group = group,
	pattern = { "*" },
	command = "startinsert",
})
---- 行番号を表示させない
autocmd({ "TermOpen" }, {
	group = group,
	pattern = { "*" },
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.signcolumn = "no"
	end,
})
