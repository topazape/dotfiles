return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
	opts = {},
	keys = {
		{ "<leader>gdc", "<CMD>DiffviewClose<bar>qa<CR>", desc = "Diffview Close & Quit" },
	},
}
