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
				max_rows = "inherit",
				width = "auto",
			},
		},
	},
	keys = {
		{ "<LocalLeader>r", "<Cmd>ArfRun<CR>", ft = "r", desc = "Run R expression" },
		{ "<LocalLeader>r", ":ArfRun<CR>", mode = "x", ft = "r", desc = "Run selected R lines" },
		{ "<LocalLeader>R", "<Cmd>ArfRunAll<CR>", ft = "r", desc = "Run all R expressions" },
		{ "<LocalLeader>c", "<Cmd>ArfClear<CR>", ft = "r", desc = "Clear R results" },
		{ "<LocalLeader>i", "<Cmd>ArfInterrupt<CR>", ft = "r", desc = "Interrupt R evaluation" },
		{ "<LocalLeader>s", "<Cmd>ArfStop<CR>", ft = "r", desc = "Stop R session" },
		{ "<LocalLeader>o", "<Cmd>ArfOutput<CR>", ft = "r", desc = "Show saved R output" },
		{ "<LocalLeader>y", "<Cmd>ArfCopyPlot<CR>", ft = "r", desc = "Copy latest plot" },
		{ "<LocalLeader><Space>", "<Cmd>ArfSummary<CR>", ft = "r", desc = "Show R object summary" },
	},
}
