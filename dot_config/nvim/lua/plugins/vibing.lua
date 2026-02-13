return {
	"shabaraba/vibing.nvim",
	dependencies = {
		-- オプション：ファイルブラウザ統合用
		-- "stevearc/oil.nvim",
	},
	build = "./build.sh", -- Neovim統合用MCPサーバーをビルド
	opts = {
		language = "ja", -- オプション："ja" | "en" | { default = "ja", chat = "ja", inline = "en" }
		permissions = {
			mode = "default", -- "default" | "acceptEdits" | "bypassPermissions"
			allow = {
				"Read", -- ファイルを読む
				-- "Edit", -- ファイルを編集
				-- "Write", -- 新しいファイルを書く
				"Glob", -- パターンでファイルを検索
				"Grep", -- ファイル内容を検索
				-- "Skill", -- スキルを使用（スラッシュコマンドとワークフロー）
			},
			deny = { "Bash" },
			rules = {}, -- オプション：きめ細かい権限ルール
		},
		chat = {
			save_location_type = "user", -- "project" | "user" | "custom"
			auto_context = true, -- 開いているバッファを自動的にコンテキストに追加
			context_position = "append", -- "prepend" | "append"
			window = {
				position = "right", -- "current" | "right" | "left" | "float"
				width = 0.4,
				border = "rounded",
			},
		},
		agent = {
			default_mode = "explore", -- "code" | "plan" | "explore"
			default_model = "opus", -- "sonnet" | "opus" | "haiku"
			prioritize_vibing_lsp = true, -- vibing-nvim LSPツールを優先（デフォルト：true）
		},
		preview = {
			enabled = true, -- 差分プレビューUIを有効化（Git必須）
		},
		keymaps = {
			send = "<CR>", -- メッセージを送信
			cancel = "<C-c>", -- 現在のリクエストをキャンセル
			add_context = "<C-a>", -- コンテキストにファイルを追加
			open_diff = "gd", -- ファイルパス上で差分ビューアーを開く
			open_file = "gf", -- ファイルパス上でファイルを開く
		},
		ui = {
			wrap = "nvim", -- 行の折り返し動作
			-- "nvim": Neovimのデフォルトを尊重（ラップ設定を変更しない）
			-- "on": wrap + linebreakを有効化（チャット可読性のため推奨）
			-- "off": 行の折り返しを無効化
			tool_result_display = "none", -- ツール実行結果の表示モード
			-- "none": ツール結果を表示しない
			-- "compact": 最初の100文字のみ表示（デフォルト）
			-- "full": 完全なツール出力を表示
			gradient = {
				enabled = true, -- AIレスポンス中のグラデーションアニメーションを有効化
				colors = {
					"#cc3300", -- 開始色（オレンジ、vibing.nvimロゴに合わせて）
					"#fffe00", -- 終了色（黄色、vibing.nvimロゴに合わせて）
				},
				interval = 30, -- アニメーション更新間隔（ミリ秒）
			},
		},
	},
}
