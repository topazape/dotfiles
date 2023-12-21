local wezterm = require("wezterm")

-- palette
-- #073b4c
-- #118ab2
-- #06d6a0
-- #ffd166
-- #ef476f

local DEFAULT_FG = { Color = "#eeeeee" }
local DEFAULT_BG = { Color = "#073b4c" }

local HEADER_TIME = { Foreground = { Color = "#118ab2" }, Text = " " }
local HEADER_DATE = { Foreground = { Color = "#ef476f" }, Text = "󱪺 " }
local HEADER_BATTERY = { Foreground = { Color = "#ffd166" }, Text = " " }
local HEADER_HOSTNAME = { Foreground = { Color = "#06d6a0" }, Text = " " }

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

local function get_hostname(elems)
	add_element(elems, HEADER_HOSTNAME, wezterm.hostname())
end

local function right_update(window)
	local elems = {}

	get_time(elems)
	get_date(elems)
	get_battery(elems)
	get_hostname(elems)

	window:set_right_status(wezterm.format(elems))
end

wezterm.on("update-status", function(window)
	right_update(window)
end)
