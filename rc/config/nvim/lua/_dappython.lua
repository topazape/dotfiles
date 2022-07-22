local virtualenv = vim.fn.expand(vim.env.VIRTUAL_ENV)
local python = virtualenv..'/bin/python'

local dp = require('dap-python')
dp.setup(python)
