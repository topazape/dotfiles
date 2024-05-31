local wezterm = require("wezterm")
local keys = require("keymaps")
require("status")

return {
	front_end = "OpenGL",

	-- color scheme
	color_scheme = "Catppuccin Macchiato",

	-- colors
	colors = {
		tab_bar = {
			active_tab = {
				bg_color = "#363a4f",
				fg_color = "#eeeeee",
			},
		},
	},

	-- font
	font = wezterm.font_with_fallback({
		{ family = "Berkeley Mono" },
		{ family = "IBM Plex Sans JP" },
	}),
	font_size = 15,
	warn_about_missing_glyphs = false,
	adjust_window_size_when_changing_font_size = false,
	line_height = 1.0,

	-- look and feel
	window_background_opacity = 1.00,
	macos_window_background_blur = 20,
	use_fancy_tab_bar = false,

	-- window size
	initial_cols = 80 + 8 * 11,
	initial_rows = 24 + 8 * 4,

	-- bell
	audible_bell = "Disabled",

	-- status
	status_update_interval = 1000,

	-- key settings
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	macos_forward_to_ime_modifier_mask = "SHIFT|CTRL",

	-- keymaps
	---- set leader_key to achieve tmux-like keybinds
	leader = { mods = "CTRL", key = "t", timeout_milliseconds = 1000 },

	keys = keys,
}
