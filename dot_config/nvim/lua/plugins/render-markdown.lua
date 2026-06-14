return {
	"MeanderingProgrammer/render-markdown.nvim",

	opts = {
		on = {
			attach = function(ctx)
				-- 既にハイライタが動いていれば何もしない（markdown 等で二重起動を防ぐ）
				if vim.treesitter.highlighter.active[ctx.buf] then
					return
				end
				local ft = vim.bo[ctx.buf].filetype
				local lang = vim.treesitter.language.get_lang(ft) or ft
				pcall(vim.treesitter.start, ctx.buf, lang)
			end,
		},

		file_types = { "markdown", "md", "AgenticChat" },

		anti_conceal = { enabled = false },

		heading = {
			position = "inline",
			sign = false,
		},

		code = {
			style = "full",
			width = "block",
			border = "thin",
		},

		pipe_table = {
			preset = "round",
			style = "full",
			cell = "padded",
			alignment_indicator = "━",
		},

		bullet = {
			icons = { "•", "∘", "▪", "▫" },
		},

		completions = {
			lsp = { enabled = true },
		},
	},
}
