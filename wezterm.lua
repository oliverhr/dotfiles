local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = false

--[[
Windows:
        sx86_64-pc-windows-msvc
macOS [Intel, Apple Silicon]:
        x86_64-apple-darwin
        aarch64-apple-darwin
Linux:
        x86_64-unknown-linux-gnu - Linux
--]]
local os = wezterm.target_triple
if os == 'x86_64-pc-windows-msvc' then
    config.window_decorations = "RESIZE" -- RESIZE | TITLE | NONE
    config.default_prog = { "pwsh", "-Login" }
    config.font = wezterm.font("Agave Nerd Font Mono")
    config.font_size = 12
elseif os == 'x86_64-apple-darwin' then
    config.window_decorations = "RESIZE | TITLE" -- RESIZE | TITLE | NONE
    config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
    config.font_size = 18
end

-- config.color_scheme = 'Sea Shells (Gogh)'
config.color_scheme = "Tokyo Night"

--[[ Cursor style available values are:
  - SteadyBlock, BlinkingBlock,
  - SteadyUnderline, BlinkingUnderline,
  - SteadyBar, BlinkingBar
]]
config.default_cursor_style = "BlinkingUnderline"

--[[ Foground text brighter than the background
config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.2,
	brightness = 1.5,
}
--]]

-- Tab bar
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true

config.keys = {
	{ key = "F9", mods = "ALT", action = wezterm.action.ShowTabNavigator },
}


return config
