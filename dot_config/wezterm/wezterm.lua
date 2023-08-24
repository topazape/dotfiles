local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		{ family = "Berkeley Mono" },
		{ family = "Pretendard JP" },
	}),
	font_size = 15,

	adjust_window_size_when_changing_font_size = false,

	warn_about_missing_glyphs = false,

	window_background_opacity = 1.00,
	macos_window_background_blur = 20,

	color_scheme = "Tokyo Night (Gogh)",

	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,

	enable_tab_bar = false,
}
