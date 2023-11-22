local wezterm = require("wezterm")

local keyconfig = {
	{ mods = "LEADER", key = "n", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ mods = "LEADER", key = "|", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "1", action = wezterm.action.ActivateTab(0) },
	{ mods = "LEADER", key = "2", action = wezterm.action.ActivateTab(1) },
	{ mods = "LEADER", key = "3", action = wezterm.action.ActivateTab(2) },
	{ mods = "LEADER", key = "4", action = wezterm.action.ActivateTab(3) },
	{ mods = "LEADER", key = "5", action = wezterm.action.ActivateTab(4) },
	{ mods = "LEADER", key = "6", action = wezterm.action.ActivateTab(5) },
	{ mods = "LEADER", key = "7", action = wezterm.action.ActivateTab(6) },
	{ mods = "LEADER", key = "8", action = wezterm.action.ActivateTab(7) },
	{ mods = "LEADER", key = "9", action = wezterm.action.ActivateTab(8) },
	{ mods = "NONE", key = "F1", action = wezterm.action.ActivateTab(0) },
	{ mods = "NONE", key = "F2", action = wezterm.action.ActivateTab(1) },
	{ mods = "NONE", key = "F3", action = wezterm.action.ActivateTab(2) },
	{ mods = "NONE", key = "F4", action = wezterm.action.ActivateTab(3) },
	{ mods = "NONE", key = "F5", action = wezterm.action.ActivateTab(4) },
	{ mods = "NONE", key = "F6", action = wezterm.action.ActivateTab(5) },
	{ mods = "NONE", key = "F7", action = wezterm.action.ActivateTab(6) },
	{ mods = "NONE", key = "F8", action = wezterm.action.ActivateTab(7) },
	{ mods = "NONE", key = "F9", action = wezterm.action.ActivateTab(8) },
}

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
	disable_default_key_bindings = true,
	leader = { mods = "CTRL", key = "t", timeout_milliseconds = 1000 },
	keys = keyconfig,

	color_scheme = "Catppuccin Mocha",
}
