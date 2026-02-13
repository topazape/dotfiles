return {
	"shabaraba/vibing.nvim",
	dependencies = {
		-- オプション：ファイルブラウザ統合用
		-- "stevearc/oil.nvim",
	},
	build = "./build.sh", -- Neovim統合用MCPサーバーをビルド
	opts = {
		agent = {
			default_mode = "explore", -- デフォルト実行モード
			-- "code": 直接実装
			-- "plan": まず計画してから実装
			-- "explore": コードベースを探索・分析
			default_model = "opus", -- デフォルトClaudeモデル
			-- "sonnet": バランス型（推奨）
			-- "opus": 最も能力が高い
			-- "haiku": 最速
			prioritize_vibing_lsp = true, -- vibing-nvim LSPツールを優先
			-- true: vibing-nvim LSPを使用（実行中のNeovimに接続）
			-- false: 汎用LSPツール（例：Serena）を許可
			-- デフォルト：true
		},
		chat = {
			window = {
				position = "right", -- ウィンドウ位置
				-- "current": 現在のウィンドウに開く
				-- "right": 右垂直分割
				-- "left": 左垂直分割
				-- "float": フローティングウィンドウ

				width = 0.4, -- ウィンドウ幅（0-1: 比率、>1: 絶対列数）
				border = "rounded", -- ボーダースタイル："rounded" | "single" | "double" | "none"
			},
			auto_context = true, -- 開いているバッファを自動的にコンテキストに追加
			save_location_type = "user", -- チャットファイルの保存場所
			-- "project": プロジェクトルートの.vibing/chat/
			-- "user": ~/.local/share/nvim/vibing/chats/
			-- "custom": save_dirパスを使用
			-- save_dir = "~/.local/share/nvim/vibing/chats", -- save_location_type="custom"の場合に使用
			context_position = "append", -- 新しいコンテキストファイルを追加する場所
			-- "append": コンテキストリストの末尾に追加
			-- "prepend": 先頭に追加
		},
		permissions = {
			mode = "default", -- 権限モード
			-- "default": 毎回確認を求める
			-- "acceptEdits": Edit/Writeを自動承認（推奨）
			-- "bypassPermissions": すべてを自動承認（慎重に使用）
			allow = { -- 許可するツール（空 = 拒否されたもの以外すべて許可）
				"Read", -- ファイルを読む
				-- "Edit", -- 既存ファイルを編集
				-- "Write", -- 新しいファイルを作成
				"Glob", -- パターンでファイルを検索
				"Grep", -- ファイル内容を検索
				-- "Bash",           -- シェルコマンドを実行（セキュリティリスク）
				-- "WebSearch",      -- Webを検索
				-- "WebFetch",       -- Webページを取得
			},
			deny = { -- 拒否するツール（allowより優先）
				"Bash", -- デフォルトでシェルコマンドをブロック
			},
			rules = {}, -- 高度：きめ細かい権限ルール
			-- きめ細かい権限ルールセクションを参照
		},
		keymaps = {
			send = "<CR>", -- メッセージを送信
			cancel = "<C-c>", -- 現在のリクエストをキャンセル
			add_context = "<C-a>", -- コンテキストにファイルを追加
			open_diff = "gd", -- ファイルパス上で差分ビューアーを開く
			open_file = "gf", -- ファイルパス上でファイルを開く
		},
		preview = {
			enabled = false, -- Telescope風の差分プレビューUIを有効化
			-- Gitリポジトリが必要
			-- コード変更後にAccept/Reject UIを表示
			-- git diffとgit checkoutを使用して元に戻す
			-- インラインアクションとチャット（gpキー）の両方で動作
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
				interval = 100, -- アニメーション更新間隔（ミリ秒）
			},
		},
		mcp = {
			enabled = false, -- MCP統合を有効化
			rpc_port = 9876, -- RPCサーバーポート
			auto_setup = false, -- プラグインインストール時にMCPサーバーを自動ビルド
			auto_configure_claude_json = false, -- ~/.claude.jsonを自動設定
		},
		-- シンプル：すべてのレスポンスを1つの言語で
		language = "ja", -- または "en"、"fr"など
	},
}
