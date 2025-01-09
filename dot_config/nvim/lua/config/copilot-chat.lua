local copilot_chat = require("CopilotChat")

copilot_chat.setup({
	model = "claude-3.5-sonnet",
	prompts = {
		-- 選択されたコードの説明を段落形式で生成
		Explain = {
			prompt = "> /COPILOT_EXPLAIN\n\n選択されたコードの説明を段落のテキストとして書いてください。",
		},
		-- 選択されたコードのコードレビューを実行
		Review = {
			prompt = "> /COPILOT_REVIEW\n\n選択されたコードを日本語でレビューしてください。",
			-- 注：追加の実装詳細はconfig.luaにあります
		},
		-- 問題のあるコードの修正版を生成
		Fix = {
			prompt = "> /COPILOT_GENERATE\n\nこのコードには問題があります。バグを修正したコードを書き直してください。",
		},
		-- コードの性能と可読性を向上させる最適化
		Optimize = {
			prompt = "> /COPILOT_GENERATE\n\n選択されたコードの性能と可読性を改善するために最適化してください。",
		},
		-- コードにドキュメンテーションコメントを追加
		Docs = {
			prompt = "> /COPILOT_GENERATE\n\n選択されたコードにドキュメンテーションコメントを追加してください。",
		},
		-- コードのテストを生成
		Tests = {
			prompt = "> /COPILOT_GENERATE\n\nコードのテストを生成してください。",
		},
		-- commitizenの規約に従ってコミットメッセージを生成
		Commit = {
			prompt = "> #git:staged\n\ncommitizenの規約に従ってコミットメッセージを書いてください。タイトルは最大50文字とし、メッセージは72文字で折り返してください。メッセージ全体をgitcommit言語のコードブロックで囲んでください。",
		},
	},
})
