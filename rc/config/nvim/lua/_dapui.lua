local dapui = require('dapui')
dapui.setup({})

-- auto
vim.api.nvim_set_keymap('n', '<leader>d', ':lua require("dapui").toggle()<CR>', {})
vim.api.nvim_set_keymap('n', '<leader><leader>df', ':lua require("dapui").eval()<CR>', {})
vim.api.nvim_set_keymap('n', '<F5>', ':DapContinue<CR>', {})
vim.api.nvim_set_keymap('n', '<F6>', ':DapTerminate<CR>', {})
vim.api.nvim_set_keymap('n', '<F10>', ':DapStepOver<CR>', {})
vim.api.nvim_set_keymap('n', '<F11>', ':DapStepInto<CR>', {})
vim.api.nvim_set_keymap('n', '<F12>', ':DapStepOut<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>b', ':DapToggleBreakpoint<CR>', {})
