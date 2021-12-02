local wezterm = require('wezterm')

return {
  -- fonts
  font = wezterm.font_with_fallback({
    { family='BlexMono Nerd Font', weight='Regular' },
    { family='Apple Symbols', weight='Regular' },
    { family='Apple Color Emoji', weight='Regular' },
    { family='Tsukushi A Round Gothic', weight='Regular' },
  }),
  font_rules = {
    {
      italic = true,
      font = wezterm.font_with_fallback({
        { family='BlexMono Nerd Font', weight='Regular', italic=true },
        { family='Apple Symbols', weight='Regular', italic=false },
        { family='Apple Color Emoji', weight='Regular', italic=false },
        { family='Tsukushi A Round Gothic', weight='Regular', italic=false },
      })
    }
  },
  font_shaper = 'Harfbuzz',
  harfbuzz_features = { 'MTLB' },
  font_size = 14.0,

  -- colors
  color_scheme_dirs = {
    wezterm.home_dir .. '/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/extras',
  },
  color_scheme = 'wezterm_tokyonight_storm',

  -- window
  window_padding = { top=0, left=2, right=2, bottom=1 },
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
