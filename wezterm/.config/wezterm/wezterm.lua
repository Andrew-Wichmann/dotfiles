local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false -- Disable the tab bar entirely
config.window_background_opacity = 0.82
config.font = wezterm.font("FantasqueSansM Nerd Font Mono")
--config.window_decorations = "NONE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 12, -- this pushes the bottom of the window to touch the waybar
  bottom = 0,
}

return config
