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
local HEADER_WEATHER = { Foreground = { Color = "#ef476f" }, Text = "󰍛 " }
local HEADER_WORKING_STATUS = { Foreground = { Color = "#ef476f" }, Text = "○ " }

local function add_element(elems, header, str)
	table.insert(elems, { Foreground = header.Foreground })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = header.Text })

	table.insert(elems, { Foreground = DEFAULT_FG })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = str .. " " })
end

local function get_working_status(elems)
	add_element(elems, HEADER_WORKING_STATUS, update_working_status())
end

local function update_working_status()
	local success, status, _ = wezterm.run_child_process({
		"jobcan",
		"status",
	})
	if success then
		if status == "Working" then
			wezterm.GLOBAL.working_status = "勤務中"
		elseif status == "Resting" then
			wezterm.GLOBAL.working_status = "休憩中"
		else
			wezterm.GLOBAL.working_status = "N/A"
		end
	else
		wezterm.GLOBAL.working_status = "N/A"
	end

	return wezterm.GLOBAL.working_status
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

	-- get_working_status(elems)
	get_time(elems)
	get_date(elems)
	get_weather(elems)
	get_battery(elems)
	get_hostname(elems)

	window:set_right_status(wezterm.format(elems))
end

wezterm.on("update-status", function(window)
	right_update(window)
end)
