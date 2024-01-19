local copilot = require("copilot")

copilot.setup({
	panel = {
		enabled = false,
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 100,
		keymap = {
			accept = "<TAB>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	filetypes = {
		cvs = false,
		gitcommit = false,
		gitrebase = false,
		help = false,
		hgcommit = false,
		markdown = false,
		svn = false,
		yaml = false,
		txt = false,
		["."] = false,
	},
	copilot_node_command = "node", -- Node.js version must be > 18.x
	server_opts_overrides = {},
})
