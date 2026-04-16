return {
	"sindrets/diffview.nvim",
	opts = {},
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>dc", "<CMD>DiffviewClose<CR>", {})
	end,
}
