local lualine = require 'lualine'
local config = {
  options = {
    theme = 'material'
  },
  sections = {
    lualine_x = {
      {'o:encoding'},
      {'fileformat', lower = false, icons_enabled = false},
      {'filetype'},
      {'diff', symbols = {added = ' ', modified = '柳 ', removed = ' '}}
    }
  },
}

lualine.setup(config)
