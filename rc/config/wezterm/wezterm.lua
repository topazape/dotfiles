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
    { family='Iosevka SS04', weight='Light' },
    { family='JuliaMono', weight='Light' },
    { family='Apple Symbols', weight='Regular' },
    { family='Apple Color Emoji', weight='Regular' },
    { family='FiraCode Nerd Font', weight='Light' },
    { family='Tsukushi A Round Gothic', weight='Regular' },
  }),
  font_shaper = 'Harfbuzz',
  harfbuzz_features = { 'MTLB' },
  dpi = 144.0,
  font_size = 14.0,

  -- colors
  color_scheme_dirs = {
    wezterm.home_dir .. '/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/extras',
  },
  color_scheme = 'wezterm_tokyonight_storm',

  -- window
  window_padding = { left=1, right=1 },
  -- backgrounds
  text_background_opacity = 0.8,
  -- window_background_image = image,
  window_background_image_hsb = {
    brightness = 0.08,
    hue = 1.0,
    saturation = 1.0,
  },

  -- tabs
  enable_tab_bar =false,

  -- bindings
  disable_default_key_bindings = true,
  keys = {
    { key='c', mods='SUPER', action=wezterm.action{ CopyTo='Clipboard' } },
    { key='v', mods='SUPER', action=wezterm.action{ PasteFrom='Clipboard' } },
    { key='f', mods='SUPER', action='ToggleFullScreen'},
    { key='r', mods='SUPER', action='ReloadConfiguration'}
  },
  disable_default_mouse_bindings = false,

  -- misc
  use_ime = true,
  check_for_updates = false,
  allow_square_glyphs_to_overflow_width = 'WhenFollowedBySpace',
  native_macos_fullscreen_mode = true,
}
