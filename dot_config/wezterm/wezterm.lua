local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		{ family = "Berkeley Mono" },
		{ family = "Pretendard JP" },
	}),
	font_size = 14,
	warn_about_missing_glyphs = false,
	adjust_window_size_when_changing_font_size = false,

	enable_tab_bar = true,

	window_background_opacity = 1.00,
	macos_window_background_blur = 20,

	audible_bell = "Disabled",
	visual_bell = {
		fade_in_duration_ms = 50,
		fade_out_duration_ms = 50,
	},

	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,

	-- keybindings
	leader = { mods = "CTRL", key = "t", timeout_milliseconds = 1000 },
	-- keys = {
	-- 	-- pane
	-- 	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- 	{ key = "|", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- 	-- tab selection
	-- 	{ key = "1", mods = "LEADER", action = wezterm.action.ActivateTab(0) },
	-- 	{ key = "F1", mods = "NONE", action = wezterm.action.ActivateTab(0) },
	-- 	{ key = "2", mods = "LEADER", action = wezterm.action.ActivateTab(1) },
	-- 	{ key = "F2", mods = "NONE", action = wezterm.action.ActivateTab(1) },
	-- 	{ key = "3", mods = "LEADER", action = wezterm.action.ActivateTab(2) },
	-- 	{ key = "F3", mods = "NONE", action = wezterm.action.ActivateTab(2) },
	-- 	{ key = "4", mods = "LEADER", action = wezterm.action.ActivateTab(3) },
	-- 	{ key = "F4", mods = "NONE", action = wezterm.action.ActivateTab(3) },
	-- 	{ key = "5", mods = "LEADER", action = wezterm.action.ActivateTab(4) },
	-- 	{ key = "F5", mods = "NONE", action = wezterm.action.ActivateTab(4) },
	-- 	{ key = "6", mods = "LEADER", action = wezterm.action.ActivateTab(5) },
	-- 	{ key = "F6", mods = "NONE", action = wezterm.action.ActivateTab(5) },
	-- 	{ key = "7", mods = "LEADER", action = wezterm.action.ActivateTab(6) },
	-- 	{ key = "F7", mods = "NONE", action = wezterm.action.ActivateTab(6) },
	-- 	{ key = "8", mods = "LEADER", action = wezterm.action.ActivateTab(7) },
	-- 	{ key = "F8", mods = "NONE", action = wezterm.action.ActivateTab(7) },
	-- 	{ key = "9", mods = "LEADER", action = wezterm.action.ActivateTab(8) },
	-- 	{ key = "F9", mods = "NONE", action = wezterm.action.ActivateTab(8) },
	-- 	{ key = "[", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
	-- 	{ key = "F11", mods = "NONE", action = wezterm.action.ActivateTabRelative(-1) },
	-- 	{ key = "]", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
	-- 	{ key = "F12", mods = "NONE", action = wezterm.action.ActivateTabRelative(1) },
	-- },

	color_scheme = "Catppuccin Mocha",
}
