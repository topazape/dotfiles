local wezterm = require("wezterm")

local keyconfig = {
	{
		key = "|",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}
for i = 1, 9 do
	-- F1 through F8 to activate that tab
	table.insert(keyconfig, {
		key = "F" .. tostring(i),
		action = wezterm.action.ActivateTab(i - 1),
	})
end
-- table.insert(keyconfig, {
-- 	key = "|",
-- 	mods = "LEADER",
-- 	action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
-- })
-- table.insert(keyconfig, {
-- 	key = "-",
-- 	mods = "LEADER",
-- 	action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
-- })

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
	keys = keyconfig,

	color_scheme = "Catppuccin Mocha",
}
