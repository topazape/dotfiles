-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },

		{ "HiPhish/rainbow-delimiters.nvim" },
		{ "OXY2DEV/helpview.nvim", config = true },
		{ "b0o/schemastore.nvim" },
		{ "chomosuke/typst-preview.nvim", ft = "typst", version = "1.*", config = true },
		{ "folke/ts-comments.nvim", config = true },
		{ "j-hui/fidget.nvim", config = true },
		{ "nvim-tree/nvim-web-devicons", config = true },
		{ "romus204/tree-sitter-manager.nvim", opts = { auto_install = true } },
		{ "tzachar/highlight-undo.nvim", config = true },
		{ "mason-org/mason.nvim", config = true },
		{
			"rainbowhxch/accelerated-jk.nvim",
			keys = {
				{ "j", "<Plug>(accelerated_jk_gj)", mode = "n" },
				{ "k", "<Plug>(accelerated_jk_gk)", mode = "n" },
			},
		},
		{
			dir = vim.fn.expand("~/Develop/local/arf.nvim"),
			name = "arf.nvim",
			cmd = { "ArfRun", "ArfClear", "ArfSummary" },
			ft = "r", -- R ファイルを開いた時点でキーバインドを登録
			dependencies = {
				{
					"folke/snacks.nvim",
					opts = { image = { enabled = true } },
				},
			},
			opts = {

				-- arf / R セッション
				executable = "arf", -- arf のコマンド名、または実行ファイルのパス
				pid = nil, -- nil: 専用セッションを自動起動。数値: 既存セッションを使用
				startup_timeout = 10000, -- 自動起動の待機時間（ミリ秒）
				timeout = 300000, -- IPC 応答の待機時間（ミリ秒）

				-- 画像の表示上限（端末のセル単位）
				image_width = 100, -- 最大幅（列）
				image_height = 30, -- 最大高さ（行）

				-- R が生成する PNG
				plot_width = 1200, -- 幅（ピクセル）
				plot_height = 800, -- 高さ（ピクセル）
				plot_res = 180, -- 描画解像度（dpi）。文字や線の大きさにも影響

				-- summary フロート
				summary_width = 60, -- 幅（列）。短い出力でもこの幅を確保
				summary_max_height = 20, -- 最大高さ（行）。内容が短ければ小さく表示

				-- 実行結果の表示・保持
				output_max_lines = 20, -- インラインの最大本文行数（省略案内・画像は別）
				output_max_bytes = 1048576, -- 1 回の実行結果の保持上限（1 MiB、エラー本文を含む）
				output_width = 120, -- 保存済み出力フロートの幅（列）
				output_max_height = 30, -- 保存済み出力フロートの最大高さ（行）

				-- 実行サイン
				signs = {
					enabled = true, -- false ならすべての実行サインを非表示
					priority = 5, -- 大きい値を優先
					range = {
						text = "│", -- 最終行以外に表示する範囲マーク
						hl = "ArfSignRange",
					},
					success = {
						text = "", -- 実行成功時の最終行
						hl = "ArfSignSuccess",
					},
					error = {
						text = "", -- R エラー時の最終行
						hl = "ArfSignError",
					},
					running = {
						text = "…", -- 開始時の記号。アニメーション無効時もこの記号
						hl = "ArfSignRunning", -- 実行中は範囲内の縦線にも適用
						frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
						interval = 80, -- コマの更新間隔（ミリ秒）
					},
				},
			},
		},
	},
})
