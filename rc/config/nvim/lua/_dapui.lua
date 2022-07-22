local dapui = require('dapui')
dapui.setup({})

-- auto
vim.api.nvim_set_keymap('n', '<leader>d', ':lua require("dapui").toggle()<CR>', {})
vim.api.nvim_set_keymap('n', '<F5>', ':DapContinue<CR>', {})
vim.api.nvim_set_keymap('n', '<F6>', ':DapTerminate<CR>', {})
vim.api.nvim_set_keymap('n', '<F10>', ':DapStepOver<CR>', {})
vim.api.nvim_set_keymap('n', '<F11>', ':DapStepInto<CR>', {})
vim.api.nvim_set_keymap('n', '<F12>', ':DapStepOut<CR>', {})

vim.api.nvim_set_keymap('n', '<leader>df', ':lua require("dapui").eval()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>b', ':DapToggleBreakpoint<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>B', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>dl', ':lua require("dap").run_last()<CR>', {})
