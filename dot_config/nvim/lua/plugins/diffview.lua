return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
	opts = {},
	keys = {
		{ "<leader>gdc", "<CMD>DiffviewClose<CR>qa<CR>", desc = "Diffview Close & Quit" },
	},
}
