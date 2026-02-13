return {
	"shabaraba/vibing.nvim",
	dependencies = {
		-- オプション：ファイルブラウザ統合用
		-- "stevearc/oil.nvim",
	},
	build = "./build.sh", -- Neovim統合用MCPサーバーをビルド
	opts = {
		-- デフォルト設定
		chat = {
			window = {
				position = "right", -- "current" | "right" | "left" | "float"
				width = 0.4,
				border = "rounded",
			},
			auto_context = true,
			save_location_type = "project", -- "project" | "user" | "custom"
			context_position = "append", -- "prepend" | "append"
		},
		agent = {
			default_mode = "code", -- "code" | "plan" | "explore"
			default_model = "opus", -- "sonnet" | "opus" | "haiku"
			prioritize_vibing_lsp = true, -- vibing-nvim LSPツールを優先（デフォルト：true）
		},
		permissions = {
			mode = "acceptEdits", -- "default" | "acceptEdits" | "bypassPermissions"
			allow = { "Read", "Edit", "Write", "Glob", "Grep" },
			deny = { "Bash" },
			rules = {}, -- オプション：きめ細かい権限ルール
		},
		preview = {
			enabled = false, -- 差分プレビューUIを有効化（Git必須）
		},
		language = ja, -- オプション："ja" | "en" | { default = "ja", chat = "ja", inline = "en" }
	},
}
