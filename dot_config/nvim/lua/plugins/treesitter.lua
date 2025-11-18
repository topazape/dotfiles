return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
