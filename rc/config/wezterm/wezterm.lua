local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		{family="JetBrains Mono Nerd Font", weight="Regular"},
		{family="BlexMono Nerd Font", weight="Regular"},
		{family="M+ 1m", weight="Regular"}
	}),
	font_size = 11.0,
	color_scheme = "Afterglow",
	use_ime = true,
	warn_about_missing_glyphs=false,
	initial_cols = 160,
	initial_rows = 48,
	
	disable_default_key_bindings = true,
	keys = {
		{key="Y", mods="CTRL", action=wezterm.action{CopyTo="ClipboardAndPrimarySelection"}},
		{key="V", mods="CTRL", action="Paste"},	
	}
}
