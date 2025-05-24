local DEFAULT_ACTIVE_FG = "#b4b1ba"
local DEFAULT_INACTIVE_FG = "#3a3a3e"
local DEFAULT_BG = "#121213"
local FONT_SIZE = 16
local CONSOLE_FONTS = {
	{ family = "TX-02" },
	{ family = "Maple Mono" },
	{ family = "Pretendard JP" },
}

local function retrieve_font_settings(fonts, weight)
	local converted = {}
	for i, font in ipairs(fonts) do
		converted[i] = { family = font.family, weight = weight }
	end
	return converted
end

local wezterm = require("wezterm")
local keymaps = require("keymaps")
local mouse_bindings = require("mouse_bindings")
require("status")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.active_pane.title
	local process_name = tab.active_pane.foreground_process_name

	-- プロセス名からファイル名部分を取得
	if process_name then
		process_name = process_name:match("([^/\\]+)$") or process_name
	end

	-- シェルの場合
	if process_name == "zsh" or process_name == "bash" or process_name == "fish" then
		return " >_ " .. (tab.tab_index + 1)
	else
		return " " .. (process_name or "unknown") .. " "
	end
end)

return {
	front_end = "OpenGL",

	-- color scheme
	color_scheme_dirs = { "~/.config/wezterm/colors" },
	color_scheme = "oldtale",

	-- colors
	colors = {
		tab_bar = {
			inactive_tab_edge = "none",
			active_tab = {
				bg_color = DEFAULT_BG,
				fg_color = DEFAULT_ACTIVE_FG,
			},
			inactive_tab = {
				bg_color = DEFAULT_BG,
				fg_color = DEFAULT_INACTIVE_FG,
			},
		},
	},

	-- font
	font = wezterm.font_with_fallback(retrieve_font_settings(CONSOLE_FONTS, "Regular")),
	font_size = FONT_SIZE,
	warn_about_missing_glyphs = false,
	cell_width = 1.05,
	line_height = 1.05,
	adjust_window_size_when_changing_font_size = false,

	-- look and feel
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	window_background_opacity = 1.00,
	macos_window_background_blur = 20,
	use_fancy_tab_bar = true,
	show_new_tab_button_in_tab_bar = false,
	window_frame = {
		active_titlebar_bg = DEFAULT_BG,
		inactive_titlebar_bg = DEFAULT_BG,
		font_size = FONT_SIZE,
		font = wezterm.font_with_fallback(retrieve_font_settings(CONSOLE_FONTS, "Black")),
	},

	-- window size
	initial_cols = 80 + 8 * 9,
	initial_rows = 24 + 8 * 3,
	-- bell
	audible_bell = "Disabled",
	visual_bell = {
		fade_in_function = "EaseIn",
		fade_in_duration_ms = 30,
		fade_out_function = "EaseOut",
		fade_out_duration_ms = 30,
	},

	-- status
	status_update_interval = 1000,

	-- misc
	check_for_updates = false,
	native_macos_fullscreen_mode = true,

	-- key settings
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	macos_forward_to_ime_modifier_mask = "SHIFT|CTRL",

	-- keymaps
	---- disable default keymaps
	disable_default_key_bindings = true,
	---- set leader_key to achieve tmux-like keybinds
	leader = { mods = "CTRL", key = "t", timeout_milliseconds = 1000 },
	keys = keymaps,
	---- set mouse bindings
	disable_default_mouse_bindings = true,
	mouse_bindings = mouse_bindings,
}
