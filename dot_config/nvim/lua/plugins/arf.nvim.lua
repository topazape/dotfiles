return {
	dir = vim.fn.expand("~/Develop/local/arf.nvim"),
	name = "arf.nvim",
	ft = "r",
	cmd = { "ArfRun", "ArfRunAll", "ArfClear", "ArfSummary", "ArfObjects", "ArfOutput", "ArfCopyPlot", "ArfStop" },
	opts = {
		eval_timeout = 21600000, -- 6 hr
		tibble_max_rows = 100,
	},
	keys = {
		{ "<LocalLeader>r", "<Cmd>ArfRun<CR>", ft = "r", desc = "Run R expression" },
		{ "<LocalLeader>r", ":ArfRun<CR>", mode = "x", ft = "r", desc = "Run selected R lines" },
		{ "<LocalLeader>R", "<Cmd>ArfRunAll<CR>", ft = "r", desc = "Run all R expressions" },
		{ "<LocalLeader>c", "<Cmd>ArfClear<CR>", ft = "r", desc = "Clear R results" },
		{ "<LocalLeader>s", "<Cmd>ArfStop<CR>", ft = "r", desc = "Stop R session" },
		{ "<LocalLeader>o", "<Cmd>ArfOutput<CR>", ft = "r", desc = "Show saved R output" },
		{ "<LocalLeader>y", "<Cmd>ArfCopyPlot<CR>", ft = "r", desc = "Copy latest plot" },
		{ "<LocalLeader><Space>", "<Cmd>ArfSummary<CR>", ft = "r", desc = "Show R object summary" },
	},
}
