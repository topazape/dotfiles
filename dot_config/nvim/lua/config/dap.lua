local dap = require("dap")
local dapuiwidgets = require("dap.ui.widgets")

vim.fn.sign_define("DapBreakpoint", { text = "◍", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DapStoped", { text = "󰑃 ", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })

vim.keymap.set("n", "<Leader>dc", dap.continue)
vim.keymap.set("n", "<Leader>dn", dap.step_over)
vim.keymap.set("n", "<Leader>di", dap.step_into)
vim.keymap.set("n", "<Leader>do", dap.step_out)
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>dB", dap.set_breakpoint)
vim.keymap.set("n", "<Leader>dh", dapuiwidgets.hover)

-- nvim-dap-ui
local dapui = require("dapui")
dapui.setup()

dap.listeners.before["event_initialized"]["custom"] = function(session, body)
	dapui.open()
end
dap.listeners.before["event_terminated"]["custom"] = function(session, body)
	dapui.close()
end

-- dap settings
dap.adapters.python = function(cb, config)
	if config.request == "attach" then
		---@diagnostic disable-next-line: undefined-field
		local port = (config.connect or config).port
		---@diagnostic disable-next-line: undefined-field
		local host = (config.connect or config).host or "127.0.0.1"
		cb({
			type = "server",
			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			host = host,
			options = {
				source_filetype = "python",
			},
		})
	else
		cb({
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter",
			options = {
				source_filetype = "python",
			},
		})
	end
end

dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		-- pythonPath = function()
		-- 	-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
		-- 	-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
		-- 	-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
		-- 	local cwd = vim.fn.getcwd()
		-- 	if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
		-- 		return cwd .. "/venv/bin/python"
		-- 	elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
		-- 		return cwd .. "/.venv/bin/python"
		-- 	else
		-- 		return "/usr/bin/python"
		-- 	end
		-- end,
	},
}

dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
	{
		type = "delve",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	-- works with go.mod packages and sub packages
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}
