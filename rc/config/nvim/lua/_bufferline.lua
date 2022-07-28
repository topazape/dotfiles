local bufferline = require('bufferline')

bufferline.setup({})

vim.api.nvim_set_keymap('n', '<C-j>', ':BufferLineCycleNext<CR>', {})
vim.api.nvim_set_keymap('n', '<C-k>', ':BufferLineCyclePrev<CR>', {})
