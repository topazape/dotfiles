local act = require("wezterm").action

return {
	-- copy
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	-- screen
	---- fullscreen
	{ key = "Enter", mods = "ALT", action = act.ToggleFullScreen },
	---- scroll
	{ key = "p", mods = "ALT", action = act.ScrollToPrompt(-1) },
	{ key = "n", mods = "ALT", action = act.ScrollToPrompt(1) },
	-- pane
	---- split
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	---- move
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	---- adjust
	{ key = "H", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "J", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "L", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "LeftArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "DownArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "UpArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "RightArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 1 }) },
	-- tab
	---- create
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	---- select
	{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
	{ key = "F1", mods = "NONE", action = act.ActivateTab(0) },
	{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
	{ key = "F2", mods = "NONE", action = act.ActivateTab(1) },
	{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
	{ key = "F3", mods = "NONE", action = act.ActivateTab(2) },
	{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
	{ key = "F4", mods = "NONE", action = act.ActivateTab(3) },
	{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },
	{ key = "F5", mods = "NONE", action = act.ActivateTab(4) },
	{ key = "6", mods = "LEADER", action = act.ActivateTab(5) },
	{ key = "F6", mods = "NONE", action = act.ActivateTab(5) },
	{ key = "7", mods = "LEADER", action = act.ActivateTab(6) },
	{ key = "F7", mods = "NONE", action = act.ActivateTab(6) },
	{ key = "8", mods = "LEADER", action = act.ActivateTab(7) },
	{ key = "F8", mods = "NONE", action = act.ActivateTab(7) },
	{ key = "9", mods = "LEADER", action = act.ActivateTab(8) },
	{ key = "F9", mods = "NONE", action = act.ActivateTab(8) },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "F11", mods = "NONE", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "F12", mods = "NONE", action = act.ActivateTabRelative(1) },
}
