local math = require('math')
local wezterm = require('wezterm')

function BuildArray(vals)
  local arr = {}
  for i, v in ipairs(vals) do
    arr[i] = v
  end
  return arr
end

local img_dir = wezterm.home_dir .. '/Pictures/pics'
local images = BuildArray(wezterm.glob(img_dir .. '/*.*'))
local image = images[math.random(#images)]

return {
  -- fonts
  font = wezterm.font_with_fallback({
    {family='JetBrains Mono', weight='Regular'},
    {family='FiraCode Nerd Font Mono', weight='Regular'},
  }),
  font_shaper = 'Harfbuzz',
  harfbuzz_features = {'zero'},
  -- font_shaper = 'Allsorts',
  dpi = 96.0,
  font_size = 13,

  -- colors
  color_scheme_dirs = {
    wezterm.home_dir .. '/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/extras',
  },
  color_scheme = 'wezterm_tokyonight_storm',

  -- backgrounds
  text_background_opacity = 0.9,
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
    {key='r', mods='SUPER', action='ReloadConfiguration'}
  },
  -- disable_default_mouse_bindings = true,

  -- misc
  use_ime = true,
  check_for_updates = false,
  allow_square_glyphs_to_overflow_width = 'WhenFollowedBySpace',
  native_macos_fullscreen_mode = true,
}
