return {
	cmd = { "raven", "--stdio" },
	init_options = {
		diagnostics = {
			stan = "on",
		},
	},
	filetypes = { "r" },
	root_markers = { "raven.toml", "rproject.toml", ".git" },

	before_init = function(params, config)
		local root = config.root_dir

		if not root or vim.fn.filereadable(root .. "/rproject.toml") == 0 or vim.fn.executable("rv") == 0 then
			return
		end

		local result = vim.system({ "rv", "library" }, { cwd = root, text = true }):wait(3000)

		if not result or result.code ~= 0 then
			vim.notify("rv library failed", vim.log.levels.WARN)
			return
		end

		local lib = vim.trim(result.stdout or "")
		if lib == "" then
			return
		end

		if not lib:match("^/") then
			lib = root .. "/" .. lib
		end
		lib = vim.fs.normalize(lib)

		if vim.fn.isdirectory(lib) ~= 1 then
			vim.notify("R library not found: " .. lib, vim.log.levels.WARN)
			return
		end

		params.initializationOptions = vim.tbl_deep_extend(
			"force",
			params.initializationOptions or {},
			{ packages = { additionalLibraryPaths = { lib } } }
		)
	end,
}
