return {
	dir = "~/Develop/local/oldtale.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("oldtale").setup({
			integrations = {
				blink = true,
				gitsigns = true,
				lazy = true,
				lsp = true,
				markdown = true,
				mason = true,
				noice = true,
				notify = true,
				octo = true,
				rainbow_delimiters = true,
				saga = true,
				telescope = false,
				treesitter = true,
			},
		})
		vim.cmd.colorscheme("oldtale")
	end,
}
