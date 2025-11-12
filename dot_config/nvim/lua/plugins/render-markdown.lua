return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown", "Avante" },
	opts = {
		heading = {
			position = "inline",
		},
		code = {
			width = "block",
			left_margin = 2,
		},
		bullet = {
			icons = { "•", "∘", "▪", "▫" },
		},
		completions = {
			lsp = { enabled = true },
		},
	},
}
