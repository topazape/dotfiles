vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "•",
			[vim.diagnostic.severity.WARN] = "•",
			[vim.diagnostic.severity.INFO] = "•",
			[vim.diagnostic.severity.HINT] = "•",
		},
	},
	severity_sort = true,
	virtual_text = {
		prefix = ">",
	},
})
