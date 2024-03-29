local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.font = wezterm.font_with_fallback { 'CaskaydiaCove Nerd Font', 'Fira Code', 'DengXian', 'JetBrains Mono', 'Noto Color Emoji', 'Symbols Nerd Font Mono', 'Segoe UI Emoji', 'FiraCode Nerd Font' }
  config.default_prog = { 'pwsh', '-NoLogo' }
  config.font_size = 11
else
  config.font = wezterm.font_with_fallback { 'FiraCode Nerd Font', 'DengXian', }
end

config.color_scheme = 'Colors (base16)'
config.window_background_opacity = 1

config.keys = {
  {
    key = '"',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 20 },
    },
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  }
}

return config

