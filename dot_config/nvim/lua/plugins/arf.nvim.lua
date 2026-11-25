return {
	dir = vim.fn.expand("~/Develop/local/arf.nvim"),
	name = "arf.nvim",
	ft = "r",
	opts = {
		eval_timeout_ms = 6 * 60 * 60 * 1000, -- 6 hr
		theme = "default",
		inline = {
			border = "rounded",
		},
		output = {
			tibble = {
				max_rows = 128,
				width = "auto",
			},
		},
		help = {
			keymaps = { follow = "<C-]>", back = "<C-[>" },
		},
	},
	keys = {
		{ "<LocalLeader>r", "<Cmd>ArfRun<CR>", ft = "r", desc = "Run R expression" },
		{ "<LocalLeader>r", ":ArfRun<CR>", mode = "x", ft = "r", desc = "Run selected lines" },
		{ "<LocalLeader>R", "<Cmd>ArfRunAll<CR>", ft = "r", desc = "Run all R expressions" },
		{ "<LocalLeader>s", "<Cmd>ArfStop<CR>", ft = "r", desc = "Stop R session" },
		{ "<LocalLeader>y", "<Cmd>ArfCopyPlot<CR>", ft = "r", desc = "Copy latest plot" },
		{ "<LocalLeader>c", "<Cmd>ArfClear<CR>", ft = "r", desc = "Clear results" },
		{ "<LocalLeader>o", "<Cmd>ArfOutput<CR>", ft = "r", desc = "Open saved output" },
		{ "<LocalLeader><Space>", "<Cmd>ArfSummary<CR>", ft = "r", desc = "Inspect R object" },
		{ "<LocalLeader>l", "<Cmd>ArfObjects<CR>", ft = "r", desc = "List R objects" },
		{ "<LocalLeader>?", "<Cmd>ArfHelp<CR>", ft = "r", desc = "Open R help" },
		{ "<LocalLeader>i", "<Cmd>ArfInterrupt<CR>", ft = "r", desc = "Interrupt R" },
	},
}
