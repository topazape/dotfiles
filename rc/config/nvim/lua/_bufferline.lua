local bufferline = require('bufferline')

bufferline.setup({
  options = {
    numbers = 'ordinal',
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_buffer_default_icon = true,
    show_close_icon = false,
    show_tab_indicators = true,
    separator_style = {'‖', '|'},
    enforce_regular_tabs = false,
    always_show_bufferline = true
  }
})

vim.api.nvim_set_keymap('n', '<C-j>', ':BufferLineCycleNext<CR>', {})
vim.api.nvim_set_keymap('n', '<C-k>', ':BufferLineCyclePrev<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>c', ':BufferLinePickClose<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>$', ':BufferLineGoToBuffer -1<CR>', {})
