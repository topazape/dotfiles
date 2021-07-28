local math = require('math')
local wezterm = require('wezterm')

local img_dir = wezterm.home_dir .. '/Pictures/pics'
Images = {}
for i, v in ipairs(wezterm.glob(img_dir .. '/*.*')) do
  Images[i] = v
end
local image = Images[math.random(#Images)]

local config = {
  -- fonts
  font = wezterm.font("JetBrainsMono Nerd Font Mono", {weight='Regular', italic=false}),
  dpi = 96.0,
  font_size = 14.0,

  -- colors
  color_scheme_dirs = {
    wezterm.home_dir .. '/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/extras',
  },
  color_scheme = 'wezterm_tokyonight_storm',

  -- backgrounds
  -- window_backgorund_opacity = 1.0,
  text_background_opacity = 0.8,
  window_background_image = image,
  window_background_image_hsb = {
    brightness = 0.3,
    hue = 1.0,
    saturation = 1.0,
  },

  -- tabs
  enable_tab_bar =false,
  -- tab_bar_at_bottom = true,
  -- tab_max_width = 32,

  -- bindings
  disable_default_key_bindings = true,
  keys = {
    {key='c', mods='SUPER', action=wezterm.action{CopyTo='Clipboard'}},
    {key='v', mods='SUPER', action=wezterm.action{PasteFrom='Clipboard'}},
    {key='f', mods='SUPER', action='ToggleFullScreen'},
  },
  -- disable_default_mouse_bindings = true,

  -- misc
  use_ime = true,
  check_for_updates = false,
  allow_square_glyphs_to_overflow_width = 'WhenFollowedBySpace',
  native_macos_fullscreen_mode = true
}

return config
