local copilot_chat = require("CopilotChat")

copilot_chat.setup({
	model = "claude-3.5-sonnet",
	prompts = {
		Explain = {
			prompt = "/COPILOT_EXPLAIN 選択されたコードの説明を段落形式のテキストで詳しく解説してください。日本語で返答してください。",
			mapping = "<Leader>ccex",
		},
		Review = {
			prompt = "/COPILOT_REVIEW 選択されたコードをレビューしてください。日本語で返答してください。",
			mapping = "<Leader>ccrev",
		},
		Fix = {
			prompt = "/COPILOT_GENERATE このコードには問題があります。バグを修正したコードに書き直してください。日本語で返答してください。",
			mapping = "<Leader>ccfix",
		},
		Optimize = {
			prompt = "/COPILOT_GENERATE 選択されたコードのパフォーマンスと可読性を向上させるため最適化してください。日本語で返答してください。",
			mapping = "<Leader>ccopt",
		},
		Docs = {
			prompt = "/COPILOT_GENERATE 選択されたコードにドキュメンテーションコメントを追加してください。日本語で返答してください。",
			mapping = "<Leader>ccdoc",
		},
		Tests = {
			prompt = "/COPILOT_GENERATE このコードのテストを生成してください。日本語で返答してください。",
			mapping = "<Leader>cctt",
		},
		Commit = {
			prompt = "commitizen の規約に従ったコミットメッセージを日本語で書いてください。",
			selection = function()
				local select = require("CopilotChat.select")
				return select.gitdiff
			end,
			mapping = "<Leader>cccm",
		},
	},
	window = {
		layout = "vertical",
		width = 0.3,
		height = 0.3,
		relative = "editor",
		border = "double",
		row = 0,
		col = 0,
		title = "Copilot Chat",
		footer = nil,
		zindex = 1,
	},
})
