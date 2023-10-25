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
		markdown = true,
		svn = false,
		yaml = true,
		["."] = false,
	},
})
