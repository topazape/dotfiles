local act = require("wezterm").action

return {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},
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
