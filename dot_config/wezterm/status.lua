local wezterm = require("wezterm")

local DEFAULT_FG = { Color = "#aaaaaa" }
local DEFAULT_BG = { Color = "#222222" }

local HEADER_DATE = { Foreground = { Color = "#ffccac" }, Text = "󱪺 " }
local HEADER_TIME = { Foreground = { Color = "#bcbabe" }, Text = " " }
local HEADER_BATTERY = { Foreground = { Color = "#dfe166" }, Text = "󰂀 " }

local function add_element(elems, header, str)
	table.insert(elems, { Foreground = header.Foreground })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = header.Text })

	table.insert(elems, { Foreground = DEFAULT_FG })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = str .. " " })
end

local function get_date(elems)
	add_element(elems, HEADER_DATE, wezterm.strftime("%m-%d %a"))
end

local function get_time(elems)
	add_element(elems, HEADER_TIME, wezterm.strftime("%H:%M"))
end

local function get_battery(elems)
	for _, b in ipairs(wezterm.battery_info()) do
		add_element(elems, HEADER_BATTERY, string.format("%.0f%%", b.state_of_charge * 100))
	end
end

local function right_update(window)
	local elems = {}

	get_time(elems)
	get_date(elems)
	get_battery(elems)

	window:set_right_status(wezterm.format(elems))
end

wezterm.on("update-status", function(window)
	right_update(window)
end)
