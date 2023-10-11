-- Pull in the wezterm API
local wezterm = require("wezterm")

local ansi = {
	"#AF3029",
	"#BC5215",
	"#AD8301",
	"#66800B",
	"#24837B",
	"#205EA6",
	"#5E409D",
	"#A02F6F",
}

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
-- config.color_scheme = "Dracula (Official)"
-- config.color_scheme = "Gruvbox Dark (Gogh)"
config.colors = {
	foreground = "#FFFCF0",
	background = "#100F0F",
	cursor_bg = "#FFFCF0",
	cursor_border = "#FFFCF0",
	cursor_fg = "#100f0f",
	selection_bg = "#403E3C",
	selection_fg = "#FFFCF0",
}
config.window_background_opacity = 1.0
config.enable_wayland = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false
config.font_size = 15
config.adjust_window_size_when_changing_font_size = false
-- config.font = wezterm.font("Comic Shanns Mono", { weight = "Regular"})

-- and finally, return the configuration to wezterm
return config
