local act = require("wezterm").action

return {
	-- Scroll wheel
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = act.ScrollByCurrentEventWheelDelta,
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = act.ScrollByCurrentEventWheelDelta,
	},

	-- Drag
	{
		event = { Drag = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.ExtendSelectionToMouseCursor("Cell"),
	},

	-- Triple-click
	{
		event = { Down = { streak = 3, button = "Left" } },
		mods = "NONE",
		action = act.SelectTextAtMouseCursor("Line"),
	},
	{
		event = { Up = { streak = 3, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},

	-- Double-click
	{
		event = { Down = { streak = 2, button = "Left" } },
		mods = "NONE",
		action = act.SelectTextAtMouseCursor("Word"),
	},
	{
		event = { Up = { streak = 2, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},

	-- Single-click
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.SelectTextAtMouseCursor("Cell"),
	},

	-- Link
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SUPER",
		action = act.OpenLinkAtMouseCursor,
	},
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "SUPER",
		action = act.Nop,
	},
}
