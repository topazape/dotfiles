return {
	"MeanderingProgrammer/render-markdown.nvim",

	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "AgenticChat",
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf, "markdown")
			end,
		})
	end,

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
