local copilot_chat = require("CopilotChat")

copilot_chat.setup({
	model = "claude-3.5-sonnet",
	prompts = {
		Explain = {
			prompt = "/COPILOT_EXPLAIN アクティブな選択範囲の説明を段落形式で書いてください。日本語で返答ください。",
		},
		Review = {
			prompt = "/COPILOT_REVIEW 選択されたコードをレビューしてください。日本語で返答ください。",
		},
		FixCode = {
			prompt = "/COPILOT_GENERATE このコードには問題があります。バグを修正したコードに書き直してください。日本語で返答ください。",
		},
		Refactor = {
			prompt = "/COPILOT_GENERATE 明瞭性と可読性を向上させるために、次のコードをリファクタリングしてください。日本語で返答ください。",
		},
		BetterNamings = {
			prompt = "/COPILOT_GENERATE 選択されたコードの変数名や関数名を改善してください。日本語で返答ください。",
		},
		Documentation = {
			prompt = "/COPILOT_GENERATE 選択範囲にドキュメントコメントを追加してください。日本語で返答ください。",
		},
		Tests = {
			prompt = "/COPILOT_GENERATE コードのテストを生成してください。日本語で返答ください。",
		},
		Wording = {
			prompt = "/COPILOT_GENERATE 次のテキストの文法と表現を改善してください。日本語で返答ください。",
		},
		Summarize = {
			prompt = "/COPILOT_GENERATE 選択範囲の要約を書いてください。日本語で返答ください。",
		},
		Spelling = {
			prompt = "/COPILOT_GENERATE 次のテキストのスペルミスを修正してください。日本語で返答ください。",
		},
		FixDiagnostic = {
			prompt = "ファイル内の次の問題を支援してください:",
			selection = function()
				local select = require("CopilotChat.select")
				return select.diagnostics
			end,
		},
		Commit = {
			prompt = "変更のコミットメッセージをcommitizenの規約に従って日本語で書いてください。タイトルは最大50文字、メッセージは72文字で折り返してください。メッセージ全体をgitcommit言語のコードブロックで囲んでください。",
			selection = function()
				local select = require("CopilotChat.select")
				return select.gitdiff
			end,
		},
		CommitStaged = {
			prompt = "変更のコミットメッセージをcommitizenの規約に従って日本語で書いてください。タイトルは最大50文字、メッセージは72文字で折り返してください。メッセージ全体をgitcommit言語のコードブロックで囲んでください。",
			selection = function(source)
				local select = require("CopilotChat.select")
				return select.gitdiff(source, true)
			end,
		},
	},
})
