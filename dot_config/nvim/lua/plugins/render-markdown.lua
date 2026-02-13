return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown" },
	opts = {
		heading = {
			position = "inline",
			sign = false,
		},
		code = {
			style = "normal",
			border = "thick",
			sign = false,
		},
		pipe_table = {
			enabled = false,
		},
		bullet = {
			icons = { "•", "∘", "▪", "▫" },
		},
		completions = {
			lsp = { enabled = true },
		},
	},
}
