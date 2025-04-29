local act = require("wezterm").action

return {
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

--
-- Mouse
-- -----
--
--                        Down { streak: 1, button: Left }           ->   SelectTextAtMouseCursor(Cell)
--         SHIFT          Down { streak: 1, button: Left }           ->   ExtendSelectionToMouseCursor(Cell)
--         ALT            Down { streak: 1, button: Left }           ->   SelectTextAtMouseCursor(Block)
--         SHIFT | ALT    Down { streak: 1, button: Left }           ->   ExtendSelectionToMouseCursor(Block)
--                        Down { streak: 1, button: Middle }         ->   PasteFrom(PrimarySelection)
--                        Down { streak: 1, button: WheelUp(1) }     ->   ScrollByCurrentEventWheelDelta
--                        Down { streak: 1, button: WheelDown(1) }   ->   ScrollByCurrentEventWheelDelta
--                        Down { streak: 2, button: Left }           ->   SelectTextAtMouseCursor(Word)
--                        Down { streak: 3, button: Left }           ->   SelectTextAtMouseCursor(Line)
--                        Drag { streak: 1, button: Left }           ->   ExtendSelectionToMouseCursor(Cell)
--         ALT            Drag { streak: 1, button: Left }           ->   ExtendSelectionToMouseCursor(Block)
--         SHIFT | CTRL   Drag { streak: 1, button: Left }           ->   StartWindowDrag
--         SUPER          Drag { streak: 1, button: Left }           ->   StartWindowDrag
--                        Drag { streak: 2, button: Left }           ->   ExtendSelectionToMouseCursor(Word)
--                        Drag { streak: 3, button: Left }           ->   ExtendSelectionToMouseCursor(Line)
--                        Up { streak: 1, button: Left }             ->   CompleteSelectionOrOpenLinkAtMouseCursor(ClipboardAndPrimarySelection)
--         SHIFT          Up { streak: 1, button: Left }             ->   CompleteSelectionOrOpenLinkAtMouseCursor(ClipboardAndPrimarySelection)
--         ALT            Up { streak: 1, button: Left }             ->   CompleteSelection(ClipboardAndPrimarySelection)
--         SHIFT | ALT    Up { streak: 1, button: Left }             ->   CompleteSelectionOrOpenLinkAtMouseCursor(PrimarySelection)
--                        Up { streak: 2, button: Left }             ->   CompleteSelection(ClipboardAndPrimarySelection)
--                        Up { streak: 3, button: Left }             ->   CompleteSelection(ClipboardAndPrimarySelection)
--
-- Mouse: alt_screen
-- -----------------
--
--                        Down { streak: 1, button: Left }     ->   SelectTextAtMouseCursor(Cell)
--         SHIFT          Down { streak: 1, button: Left }     ->   ExtendSelectionToMouseCursor(Cell)
--         ALT            Down { streak: 1, button: Left }     ->   SelectTextAtMouseCursor(Block)
--         SHIFT | ALT    Down { streak: 1, button: Left }     ->   ExtendSelectionToMouseCursor(Block)
--                        Down { streak: 1, button: Middle }   ->   PasteFrom(PrimarySelection)
--                        Down { streak: 2, button: Left }     ->   SelectTextAtMouseCursor(Word)
--                        Down { streak: 3, button: Left }     ->   SelectTextAtMouseCursor(Line)
--                        Drag { streak: 1, button: Left }     ->   ExtendSelectionToMouseCursor(Cell)
--         ALT            Drag { streak: 1, button: Left }     ->   ExtendSelectionToMouseCursor(Block)
--         SHIFT | CTRL   Drag { streak: 1, button: Left }     ->   StartWindowDrag
--         SUPER          Drag { streak: 1, button: Left }     ->   StartWindowDrag
--                        Drag { streak: 2, button: Left }     ->   ExtendSelectionToMouseCursor(Word)
--                        Drag { streak: 3, button: Left }     ->   ExtendSelectionToMouseCursor(Line)
--                        Up { streak: 1, button: Left }       ->   CompleteSelectionOrOpenLinkAtMouseCursor(ClipboardAndPrimarySelection)
--         SHIFT          Up { streak: 1, button: Left }       ->   CompleteSelectionOrOpenLinkAtMouseCursor(ClipboardAndPrimarySelection)
--         ALT            Up { streak: 1, button: Left }       ->   CompleteSelection(ClipboardAndPrimarySelection)
--         SHIFT | ALT    Up { streak: 1, button: Left }       ->   CompleteSelectionOrOpenLinkAtMouseCursor(PrimarySelection)
--                        Up { streak: 2, button: Left }       ->   CompleteSelection(ClipboardAndPrimarySelection)
--                        Up { streak: 3, button: Left }       ->   CompleteSelection(ClipboardAndPrimarySelection)
