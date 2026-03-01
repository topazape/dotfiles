return {
	"olexsmir/gopher.nvim",
	ft = "go",
	build = function()
		require("gopher.installer").install_deps()
	end,
	opts = {},
}
