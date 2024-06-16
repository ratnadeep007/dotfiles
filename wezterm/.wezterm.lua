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
-- config.color_scheme = "Dracula (Official)"
config.color_scheme = "Kanagawa (Gogh)"
-- config.font = wezterm.font("Cascadia Code PL")
-- config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font("Iosevka Term", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.font = wezterm.font({
	family = "Monaspace Neon",
	-- family = "Monaspace Radon",
	weight = "Regular",
	harfbuzz_features = {
		"ss01=1",
		"ss02=1",
		"ss03=1",
		"ss04=1",
		"ss05=1",
		"ss06=1",
		"ss07=1",
		"ss08=1",
		"calt=1",
		"dlig=1",
	},
})
config.color_scheme = "Kanagawa (Gogh)"
config.window_background_opacity = 2.0
config.enable_wayland = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false
config.font_size = 15
config.adjust_window_size_when_changing_font_size = false
config.line_height = 1.5
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- config.font = wezterm.font("Comic Shanns Mono", { weight = "Regular"})

-- and finally, return the configuration to wezterm
return config
