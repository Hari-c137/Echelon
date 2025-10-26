local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.5
config.color_scheme = "Batman"

config.colors = {
	cursor_bg = "white",
}

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 15,
}

return config
