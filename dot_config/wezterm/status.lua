local wezterm = require("wezterm")

-- palette
-- #001219
-- #005f73
-- #0a9396
-- #94d2bd
-- #e9d8a6
-- #ee9b00
-- #ca6702
-- #bb3e03
-- #ae2012
-- #9b2226

local DEFAULT_FG = { Color = "#e9d8a6" }
local DEFAULT_BG = { Color = "#001219" }

local HEADER_TIME = { Foreground = { Color = "#e9d8a6" }, Text = " " }
local HEADER_DATE = { Foreground = { Color = "#9b2226" }, Text = "󱪺 " }
local HEADER_BATTERY = { Foreground = { Color = "#94d2bd" }, Text = " " }
local HEADER_HOSTNAME = { Foreground = { Color = "#ee9b00" }, Text = " " }

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
