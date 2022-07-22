local virtualenv = vim.fn.expand(vim.env.VIRTUAL_ENV)
local python_path = virtualenv..'/bin/python'

local dp = require('dap-python')
dp.setup(python_path)
