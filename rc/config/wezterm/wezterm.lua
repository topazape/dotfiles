local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		{family="BlexMono Nerd Font Mono", weight="Regular"},
		{family="M+ 1m", weight="Regular"}
	}),
	font_size = 11.0,
	color_scheme = "Afterglow",
	use_ime = true,
	warn_about_missing_glyphs=false,
	
	disable_default_key_bindings = true,
	keys = {
		{key="Y", mods="CTRL", action=wezterm.action{CopyTo="ClipboardAndPrimarySelection"}},
		{key="V", mods="CTRL", action="Paste"},	
	}
}
