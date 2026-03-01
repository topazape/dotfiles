return {
	"fredrikaverpil/godoc.nvim",
	version = "*",
	dependencies = {
		{ "folke/snacks.nvim" }, -- optional
	},
	build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
	cmd = { "GoDoc" }, -- optional
	opts = {}, -- see further down below for configuration
}
