local wezterm = require("wezterm")

require("status")
require("keymaps")

return {
	-- color scheme
	color_scheme = "Catppuccin Mocha",

	-- colors
	colors = {
		tab_bar = {
			active_tab = {
				bg_color = "#073b4c",
				fg_color = "#eeeeee",
			},
		},
	},

	-- font
	font = wezterm.font_with_fallback({
		{ family = "Berkeley Mono" },
		{ family = "Pretendard JP" },
	}),
	font_size = 14,
	warn_about_missing_glyphs = false,
	adjust_window_size_when_changing_font_size = false,

	-- look and feel
	window_background_opacity = 0.90,
	macos_window_background_blur = 20,
	use_fancy_tab_bar = false,

	-- bell
	audible_bell = "Disabled",
	visual_bell = {
		fade_in_duration_ms = 50,
		fade_out_duration_ms = 50,
	},

	-- status
	status_update_interval = 1000,
}
