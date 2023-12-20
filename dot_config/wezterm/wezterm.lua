local wezterm = require("wezterm")

return {
	-- color scheme
	color_scheme = "Catppuccin Mocha",

	-- font
	font = wezterm.font_with_fallback({
		{ family = "Berkeley Mono" },
		{ family = "Pretendard JP" },
	}),
	font_size = 14,
	warn_about_missing_glyphs = false,
	adjust_window_size_when_changing_font_size = false,

	-- look and feel
	window_background_opacity = 1.00,
	macos_window_background_blur = 20,
	use_fancy_tab_bar = false,

	-- status
	wezterm.on("update-status", function(window, pane)
		-- Each element holds that text for a cell in a "powerline" style << fade
		local cells = {}

		-- current working directory
		local cwd_uri = pane:get_current_working_dir()
		if cwd_uri then
			cwd_uri = cwd_uri:sub(8) --trim file://
			local slash = cwd_uri:find("/")
			local cwd = cwd_uri:sub(slash)
			table.insert(cells, cwd)
		end

		-- workspace name
		local work_space = window:active_workspace()
		table.insert(cells, work_space)

		-- date/time: e.g.) "Wed Mar 3 08:14"
		local date = wezterm.strftime("%a %b %-d %H:%M")
		table.insert(cells, date)

		-- An Entry for each battery (typically 0 or 1 battery)
		local BATTERY = utf8.char(0xf240)
		for _, b in ipairs(wezterm.battery_info()) do
			table.insert(cells, string.format(BATTERY .. " %.0f%%", b.state_of_charge * 100))
		end

		-- The powerline < symbol
		local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

		-- Color palette for the background of each cell
		local colors = {
			"#3c1361",
			"#52307c",
			"#663a82",
			"#7c5295",
			"#b491c8",
		}

		-- Forground color for the text across the fade
		local text_fg = "#c0c0c0"

		-- the elements to be formatted
		local elements = {}

		-- How many cells have been formatted
		local num_cells = 0

		-- Translate a cell into elements
		function push(text, is_last)
			local cell_no = num_cells + 1
			table.insert(elements, { Foreground = { Color = text_fg } })
			table.insert(elements, { Background = { Color = colors[cell_no] } })
			table.insert(elements, { Text = " " .. text .. " " })
			if not is_last then
				table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
				table.insert(elements, { Text = SOLID_LEFT_ARROW })
			end
			num_cells = num_cells + 1
		end

		while #cells > 0 do
			local cell = table.remove(cells, 1)
			push(cell, #cells == 0)
		end

		window:set_right_status(wezterm.format(elements))
	end),

	-- bell
	audible_bell = "Disabled",
	visual_bell = {
		fade_in_duration_ms = 50,
		fade_out_duration_ms = 50,
	},

	-- key config
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	---- set leader_key to achieve tmux-like keybinds
	leader = { mods = "CTRL", key = "t", timeout_milliseconds = 1000 },
	---- additional keybinds
	keys = {
		-- pane
		---- split
		{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		---- move
		{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
		---- adjust
		{ key = "H", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "J", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "K", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "L", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "LeftArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "DownArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "UpArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "RightArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
		-- tab
		---- create
		{ key = "t", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		---- select
		{ key = "1", mods = "LEADER", action = wezterm.action.ActivateTab(0) },
		{ key = "F1", mods = "NONE", action = wezterm.action.ActivateTab(0) },
		{ key = "2", mods = "LEADER", action = wezterm.action.ActivateTab(1) },
		{ key = "F2", mods = "NONE", action = wezterm.action.ActivateTab(1) },
		{ key = "3", mods = "LEADER", action = wezterm.action.ActivateTab(2) },
		{ key = "F3", mods = "NONE", action = wezterm.action.ActivateTab(2) },
		{ key = "4", mods = "LEADER", action = wezterm.action.ActivateTab(3) },
		{ key = "F4", mods = "NONE", action = wezterm.action.ActivateTab(3) },
		{ key = "5", mods = "LEADER", action = wezterm.action.ActivateTab(4) },
		{ key = "F5", mods = "NONE", action = wezterm.action.ActivateTab(4) },
		{ key = "6", mods = "LEADER", action = wezterm.action.ActivateTab(5) },
		{ key = "F6", mods = "NONE", action = wezterm.action.ActivateTab(5) },
		{ key = "7", mods = "LEADER", action = wezterm.action.ActivateTab(6) },
		{ key = "F7", mods = "NONE", action = wezterm.action.ActivateTab(6) },
		{ key = "8", mods = "LEADER", action = wezterm.action.ActivateTab(7) },
		{ key = "F8", mods = "NONE", action = wezterm.action.ActivateTab(7) },
		{ key = "9", mods = "LEADER", action = wezterm.action.ActivateTab(8) },
		{ key = "F9", mods = "NONE", action = wezterm.action.ActivateTab(8) },
		{ key = "[", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "F11", mods = "NONE", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "]", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
		{ key = "F12", mods = "NONE", action = wezterm.action.ActivateTabRelative(1) },
	},
}

-- default keybinds
-- keys = {
--   { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
--   { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
--   { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },
--   { key = '!', mods = 'CTRL', action = act.ActivateTab(0) },
--   { key = '!', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
--   { key = '\"', mods = 'ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
--   { key = '\"', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
--   { key = '#', mods = 'CTRL', action = act.ActivateTab(2) },
--   { key = '#', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
--   { key = '$', mods = 'CTRL', action = act.ActivateTab(3) },
--   { key = '$', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
--   { key = '%', mods = 'CTRL', action = act.ActivateTab(4) },
--   { key = '%', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
--   { key = '%', mods = 'ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
--   { key = '%', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
--   { key = '&', mods = 'CTRL', action = act.ActivateTab(6) },
--   { key = '&', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
--   { key = '\'', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
--   { key = '(', mods = 'CTRL', action = act.ActivateTab(-1) },
--   { key = '(', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
--   { key = ')', mods = 'CTRL', action = act.ResetFontSize },
--   { key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
--   { key = '*', mods = 'CTRL', action = act.ActivateTab(7) },
--   { key = '*', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
--   { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
--   { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
--   { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
--   { key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
--   { key = '-', mods = 'SUPER', action = act.DecreaseFontSize },
--   { key = '0', mods = 'CTRL', action = act.ResetFontSize },
--   { key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
--   { key = '0', mods = 'SUPER', action = act.ResetFontSize },
--   { key = '1', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
--   { key = '1', mods = 'SUPER', action = act.ActivateTab(0) },
--   { key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
--   { key = '2', mods = 'SUPER', action = act.ActivateTab(1) },
--   { key = '3', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
--   { key = '3', mods = 'SUPER', action = act.ActivateTab(2) },
--   { key = '4', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
--   { key = '4', mods = 'SUPER', action = act.ActivateTab(3) },
--   { key = '5', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
--   { key = '5', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
--   { key = '5', mods = 'SUPER', action = act.ActivateTab(4) },
--   { key = '6', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
--   { key = '6', mods = 'SUPER', action = act.ActivateTab(5) },
--   { key = '7', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
--   { key = '7', mods = 'SUPER', action = act.ActivateTab(6) },
--   { key = '8', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
--   { key = '8', mods = 'SUPER', action = act.ActivateTab(7) },
--   { key = '9', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
--   { key = '9', mods = 'SUPER', action = act.ActivateTab(-1) },
--   { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
--   { key = '=', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
--   { key = '=', mods = 'SUPER', action = act.IncreaseFontSize },
--   { key = '@', mods = 'CTRL', action = act.ActivateTab(1) },
--   { key = '@', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
--   { key = 'C', mods = 'CTRL', action = act.CopyTo 'Clipboard' },
--   { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
--   { key = 'F', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
--   { key = 'F', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
--   { key = 'H', mods = 'CTRL', action = act.HideApplication },
--   { key = 'H', mods = 'SHIFT|CTRL', action = act.HideApplication },
--   { key = 'K', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
--   { key = 'K', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
--   { key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay },
--   { key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
--   { key = 'M', mods = 'CTRL', action = act.Hide },
--   { key = 'M', mods = 'SHIFT|CTRL', action = act.Hide },
--   { key = 'N', mods = 'CTRL', action = act.SpawnWindow },
--   { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
--   { key = 'P', mods = 'CTRL', action = act.ActivateCommandPalette },
--   { key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
--   { key = 'Q', mods = 'CTRL', action = act.QuitApplication },
--   { key = 'Q', mods = 'SHIFT|CTRL', action = act.QuitApplication },
--   { key = 'R', mods = 'CTRL', action = act.ReloadConfiguration },
--   { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
--   { key = 'T', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
--   { key = 'T', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
--   { key = 'U', mods = 'CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
--   { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
--   { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
--   { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
--   { key = 'W', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
--   { key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
--   { key = 'X', mods = 'CTRL', action = act.ActivateCopyMode },
--   { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
--   { key = 'Z', mods = 'CTRL', action = act.TogglePaneZoomState },
--   { key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
--   { key = '[', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
--   { key = ']', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
--   { key = '^', mods = 'CTRL', action = act.ActivateTab(5) },
--   { key = '^', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
--   { key = '_', mods = 'CTRL', action = act.DecreaseFontSize },
--   { key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
--   { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
--   { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
--   { key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
--   { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
--   { key = 'h', mods = 'SHIFT|CTRL', action = act.HideApplication },
--   { key = 'h', mods = 'SUPER', action = act.HideApplication },
--   { key = 'k', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
--   { key = 'k', mods = 'SUPER', action = act.ClearScrollback 'ScrollbackOnly' },
--   { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
--   { key = 'm', mods = 'SHIFT|CTRL', action = act.Hide },
--   { key = 'm', mods = 'SUPER', action = act.Hide },
--   { key = 'n', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
--   { key = 'n', mods = 'SUPER', action = act.SpawnWindow },
--   { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
--   { key = 'q', mods = 'SHIFT|CTRL', action = act.QuitApplication },
--   { key = 'q', mods = 'SUPER', action = act.QuitApplication },
--   { key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
--   { key = 'r', mods = 'SUPER', action = act.ReloadConfiguration },
--   { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
--   { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
--   { key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
--   { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
--   { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
--   { key = 'w', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
--   { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab{ confirm = true } },
--   { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
--   { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
--   { key = '{', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
--   { key = '{', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
--   { key = '}', mods = 'SUPER', action = act.ActivateTabRelative(1) },
--   { key = '}', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
--   { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
--   { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
--   { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
--   { key = 'PageUp', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },
--   { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
--   { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
--   { key = 'PageDown', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },
--   { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
--   { key = 'LeftArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
--   { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
--   { key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },
--   { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
--   { key = 'UpArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
--   { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
--   { key = 'DownArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },
--   { key = 'Copy', mods = 'NONE', action = act.CopyTo 'Clipboard' },
--   { key = 'Paste', mods = 'NONE', action = act.PasteFrom 'Clipboard' },
-- },
--
-- key_tables = {
--   copy_mode = {
--     { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
--     { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
--     { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
--     { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
--     { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
--     { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
--     { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
--     { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
--     { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
--     { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
--     { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
--     { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
--     { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
--     { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
--     { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
--     { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
--     { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
--     { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
--     { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
--     { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
--     { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
--     { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
--     { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
--     { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
--     { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
--     { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
--     { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
--     { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
--     { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
--     { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
--     { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
--     { key = 'c', mods = 'CTRL', action = act.CopyMode 'Close' },
--     { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
--     { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
--     { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
--     { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
--     { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
--     { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
--     { key = 'g', mods = 'CTRL', action = act.CopyMode 'Close' },
--     { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
--     { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
--     { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
--     { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
--     { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
--     { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
--     { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
--     { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
--     { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
--     { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
--     { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
--     { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
--     { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
--     { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
--     { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
--     { key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
--     { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
--     { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
--     { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
--     { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
--     { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
--     { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
--     { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
--   },
--
--   search_mode = {
--     { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
--     { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
--     { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
--     { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
--     { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
--     { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
--     { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
--     { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
--     { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
--     { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
--   },
-- }
