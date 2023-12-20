local wezterm = require("wezterm")

local DEFAULT_FG = { Color = "#9a9eab" }
local DEFAULT_BG = { Color = "#333333" }
local SPACE_1 = " "
local SPACE_3 = "   "

local HEADER_DATE = { Foreground = { Color = "#ffccac" }, Text = "󱪺" }
local HEADER_TIME = { Foreground = { Color = "#bcbabe" }, Text = "" }
local HEADER_BATTERY = { Foreground = { Color = "#dfe166" }, Text = "" }

local function AddElement(elems, header, str)
	table.insert(elems, { Foreground = header.Foreground })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = header.Text .. SPACE_1 })

	table.insert(elems, { Foreground = DEFAULT_FG })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = str .. SPACE_3 })
end

local function GetDate(elems)
	AddElement(elems, HEADER_DATE, wezterm.strftime("%a %b %-d"))
end

local function GetTime(elems)
	AddElement(elems, HEADER_TIME, wezterm.strftime("%H:%M"))
end

local function GetBattery(elems, window)
	for _, b in ipairs(wezterm.battery_info()) do
		AddElement(elems, HEADER_BATTERY, string.format("%.0f%%", b.state_of_charge * 100))
	end
end

local function RightUpdate(window, pane)
	local elems = {}

	GetTime(elems)
	GetDate(elems)
	GetBattery(elems, window)

	window:set_right_status(wezterm.format(elems))
end

wezterm.on("update-status", function(window, pane)
	RightUpdate(window, pane)
end)
