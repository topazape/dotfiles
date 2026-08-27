return {
	"olexsmir/gopher.nvim",
	ft = "go",
	lazy = false,
	build = function()
		-- require("gopher.installer").install_deps()
		vim.cmd.GoInstallDeps()
	end,
	opts = {},
}
