local wezterm = require('wezterm');

local config = {
  -- fonts
  font = wezterm.font_with_fallback({
    'JetBrains Mono',
    'Hack Nerd Font Mono',
    'Noto Sans CJK JP'
  }),
  dpi = 144.0,
  font_size = 14.0,
  font_shaper = 'Harfbuzz',
  harfbuzz_features = {'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'zero', 'onum'},

  --colors
  color_scheme_dirs = {
    os.getenv('HOME')..'/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/extras',
  },
  color_scheme = 'wezterm_tokyonight_storm',

  -- misc
  use_ime = true,
  enable_tab_bar = false,
  disable_default_key_bindings = true,
  disable_default_mouse_bindings = true,
}

return config
