-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {
	colors = {
		cursor_fg = "#ffffff",
	},
}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Dracula (Official)"
config.window_background_opacity = 1.0
config.enable_wayland = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false
-- config.font = wezterm.font("Comic Shanns Mono", { weight = "Regular"})

-- and finally, return the configuration to wezterm
return config
