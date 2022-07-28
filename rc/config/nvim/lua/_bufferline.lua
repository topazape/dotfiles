local bufferline = require('bufferline')

bufferline.setup({
  options = {
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
vim.api.nvim_set_keymap('n', '<leader>rh', ':BufferLineCloseLeft<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>rl', ':BufferLineCloseRight<CR>', {})
