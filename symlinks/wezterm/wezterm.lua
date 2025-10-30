local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 13.5
config.color_scheme = "Batman"

config.colors = {
	cursor_bg = "white",
}

config.default_prog = { 'fish', '-l' }
config.webgpu_preferred_adapter = {
	backend = "Vulkan",
	device = 29824,
	device_type = "DiscreteGpu",
	driver = "radv",
	driver_info = "Mesa 25.2.5",
	name = "AMD Radeon RX 7600 (RADV NAVI33)",
	vendor = 4098,
}
config.default_cursor_style = 'BlinkingBar'
config.enable_kitty_graphics = true
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.animation_fps = 137
config.max_fps = 137
config.enable_wayland = true

config.keys = {
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
}

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}

return config
