return {
	"Vigemus/iron.nvim",

	ft = { "r", "python" },

	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")
		local common = require("iron.fts.common")

		iron.setup({
			config = {
				scratch_repl = true,

				repl_definition = {
					r = {
						command = { "arf" },
						format = common.bracketed_paste,
					},

					python = {
						command = { "ptpython" },
						format = common.bracketed_paste,
					},
				},

				repl_open_cmd = view.split.vertical.botright(80),
			},

			-- repl 名前空間 <space>r に全集約。高頻度ほど低打鍵。
			keymaps = {
				-- REPL 制御
				toggle_repl = "<space>rr", -- 開閉
				restart_repl = "<space>rR", -- 再起動
				interrupt = "<space>rc", -- Ctrl-C 相当 (c=cancel)
				exit = "<space>rq", -- 終了
				clear = "<space>rx", -- 画面クリア
				cr = "<space>r<cr>", -- 改行送信

				-- 送信（高頻度：行・段落・選択・motion）
				send_line = "<space>rl",
				send_paragraph = "<space>rp",
				visual_send = "<space>rs", -- visual: 選択送り
				send_motion = "<space>rs", -- normal: operator (<space>rs + motion)
				send_file = "<space>rf",
				send_until_cursor = "<space>ru",

				-- コードブロック（R チャンク逐次実行）
				send_code_block = "<space>rb",
				send_code_block_and_move = "<space>rj", -- j=down 連想

				-- mark 系（低頻度：rm 二段に退避）
				mark_motion = "<space>rmm",
				mark_visual = "<space>rmm",
				send_mark = "<space>rms",
				remove_mark = "<space>rmd",
			},

			ignore_blank_lines = true,
		})
	end,
}
