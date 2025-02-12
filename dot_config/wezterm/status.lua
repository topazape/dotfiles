local wezterm = require("wezterm")

local DEFAULT_FG = { Color = "#b4b1ba" }
local DEFAULT_BG = { Color = "#121213" }

local HEADER_TIME = { Foreground = { Color = "#8292c7" }, Text = " " }
local HEADER_DATE = { Foreground = { Color = "#e996b0" }, Text = "󱪺 " }
local HEADER_BATTERY = { Foreground = { Color = "#e6b9a3" }, Text = " " }
local HEADER_WEATHER = { Foreground = { Color = "#e89890" }, Text = "󰍛 " }
local HEADER_HOSTNAME = { Foreground = { Color = "#89a891" }, Text = " " }

local function add_element(elems, header, str)
	table.insert(elems, { Foreground = header.Foreground })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = header.Text })

	table.insert(elems, { Foreground = DEFAULT_FG })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = str .. " " })
end

local function get_date(elems)
	add_element(elems, HEADER_DATE, wezterm.strftime("%a %d/%m/%Y"))
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

local function update_weather()
	local update_count = wezterm.GLOBAL.weather_update_count or 0
	update_count = update_count + 1
	wezterm.GLOBAL.weather_update_count = update_count

	if update_count == 1 or update_count % 3600 == 0 then
		-- c    Weather condition,
		-- C    Weather condition textual name,
		-- x    Weather condition, plain-text symbol,
		-- h    Humidity,
		-- t    Temperature (Actual),
		-- f    Temperature (Feels Like),
		-- w    Wind,
		-- l    Location,
		-- m    Moon phase 🌑🌒🌓🌔🌕🌖🌗🌘,
		-- M    Moon day,
		-- p    Precipitation (mm/3 hours),
		-- P    Pressure (hPa),
		-- u    UV index (1-12),
		local success, weather_info, _ = wezterm.run_child_process({
			"curl",
			"--silent",
			"wttr.in/Tokyo?format=%l:+%c%t+%m",
		})
		if success then
			wezterm.GLOBAL.weather = weather_info:gsub("\n", "")
		else
			wezterm.GLOBAL.weather = "N/A"
		end
	end

	return wezterm.GLOBAL.weather
end

local function get_weather(elems)
	add_element(elems, HEADER_WEATHER, update_weather())
end

local function right_update(window)
	local elems = {}

	get_time(elems)
	get_date(elems)
	get_weather(elems)
	get_battery(elems)
	-- get_hostname(elems)

	window:set_right_status(wezterm.format(elems))
end

wezterm.on("update-status", function(window)
	right_update(window)
end)
