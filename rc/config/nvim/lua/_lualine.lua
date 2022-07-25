local lualine = require('lualine')
local config = {
  options = {
    theme = 'duskfox'
  },
  sections = {
    lualine_a = { {'mode'} },
    lualine_b = { {'branch'}, {'diagnostics'}, {'diff', symbols = {added = ' ', modified = '柳 ', removed = ' '}} },
    lualine_c = { {'filename', path = 1 } },
    lualine_x = { {'filetype'}, {'encoding'}, {'fileformat', icons_enabled = false} },
    lualine_y = { {'progress'} },
    lualine_z = { {'location'} }
  },
}

lualine.setup(config)
