-- disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- options
local options = {
	-- 種々ファイルの出力
	backup = false,
	swapfile = false,
	undofile = false,

	-- 表示
	---- 番号表示
	number = true,
	numberwidth = 4,
	---- ルーラー
	ruler = false,
	---- 特殊文字表示
	list = true,
	listchars = { eol = "¬", tab = "› ", trail = "˽", extends = "»", precedes = "«", nbsp = "·" },
	fillchars = { fold = "‣", eob = "◦" },
	---- モード表示
	showmode = false,
	---- カーソルがある行の協調表示
	cursorline = true,
	cursorlineopt = { "number" },
	---- 目印カラム表示
	signcolumn = "yes", -- 常に表示
	---- カッコの連携
	showmatch = true,
	matchtime = 1, -- 0.1 秒の何倍かを設定
	---- 行の折り返し
	breakindent = true, -- 行を折り返すときにインデントを考慮する
	---- 画面分割
	splitbelow = true,
	splitright = true,
	---- floating windows を半透明にする: 100 で透明
	winblend = 10,

	-- 補完
	---- insert モード時の補完オプション
	completeopt = { "menuone", "noinsert", "noselect" },

	-- 検索
	ignorecase = true, -- 大文字無視
	smartcase = true, -- 大文字で検索したら区別する

	-- ファイル環境
	fileencodings = { "ucs-bom", "utf-8", "iso-2022-jp", "sjis", "euc-jp" },
	fileformats = { "unix", "dos", "mac" },

	-- その他
	---- クリップボード
	clipboard = "unnamedplus",
	---- マウスを無効化
	mouse = "",
	---- 24-bit RGB カラーを有効化(TUI時)
	termguicolors = true,
}

-- apply options
for k, v in pairs(options) do
	vim.opt[k] = v
end
