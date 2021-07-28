local wezterm = require('wezterm')

wezterm.on('format-tab-title',
  function(tab)
    local title = tab.active_pane.title
    local width = wezterm.column_width(title)
    return {
      {Background={Color='#c0c0c0'}},
      {Foreground={Color='#2b2042'}},
      {Text=' ' .. title .. ' '},
      {Background={Color='#2b2042'}},
      {Foreground={Color='#c0c0c0'}},
      {Text=utf8.char(0xe0b0)},
    }
  end
)

local config = {
  -- fonts
  font = wezterm.font_with_fallback({
    {family='JetBrainsMono Nerd Font', weight='Regular'},
  }),
  font_rules = {
    {
      intensity = 'Normal',
      italic = false,
      font = wezterm.font_with_fallback(
        {
          {family='JetBrainsMono Nerd Font', weight='Regular', italic=false},
        }
      ),
    },
    {
      intensity = 'Normal',
      italic = true,
      font = wezterm.font_with_fallback(
        {
          {family='JetBrainsMono Nerd Font', weight='Regular', italic=true},
        }
      ),
    },
    {
      intensity = 'Bold',
      italic = false,
      font = wezterm.font_with_fallback(
        {
          {family='JetBrainsMono Nerd Font', weight='Bold', italic=false},
        }
      ),
    },
    {
      intensity = 'Bold',
      italic = true,
      font = wezterm.font_with_fallback(
        {
          {family='JetBrainsMono Nerd Font', weight='Bold', italic=true},
        }
      ),
    },
  },
  dpi = 144.0,
  font_size = 14.0,

  -- colors
  color_scheme_dirs = {
    wezterm.home_dir .. '/.local/share/nvim/site/pack/packer/start/tokyonight.nvim/extras',
  },
  color_scheme = 'wezterm_tokyonight_storm',

  -- tabs
  tab_bar_at_bottom = true,
  tab_max_width = 32,

  -- bindings
  -- disable_default_key_bindings = true,
  -- disable_default_mouse_bindings = true,

  -- misc
  use_ime = true,
  check_for_updates = false,
}

return config
