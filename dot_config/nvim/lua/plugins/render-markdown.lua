return {
	"MeanderingProgrammer/render-markdown.nvim",

	opts = {
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
