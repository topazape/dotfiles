return {
	dir = vim.fn.expand("~/Develop/local/arf.nvim"),
	name = "arf.nvim",
	ft = "r",
	cmd = { "ArfRun", "ArfRunAll", "ArfClear", "ArfSummary", "ArfOutput", "ArfStop" },
	opts = {
		tibble_max_rows = 100,
	},
	keys = {
		{ "<c-cr>", "<Cmd>ArfRun<CR>", ft = "r", desc = "Run R expression" },
		{ "<LocalLeader>fr", ":ArfRun<CR>", mode = "x", ft = "r", desc = "Run selected R lines" },
		{ "<LocalLeader>fR", "<Cmd>ArfRunAll<CR>", ft = "r", desc = "Run all R expressions" },
		{ "<LocalLeader>fc", "<Cmd>ArfClear<CR>", ft = "r", desc = "Clear R results" },
		{ "<LocalLeader>fs", "<Cmd>ArfStop<CR>", ft = "r", desc = "Stop R session" },
		{ "<LocalLeader>fo", "<Cmd>ArfOutput<CR>", ft = "r", desc = "Show saved R output" },
		{ "<LocalLeader>fk", "<Cmd>ArfSummary<CR>", ft = "r", desc = "Show R object summary" },
	},
}
