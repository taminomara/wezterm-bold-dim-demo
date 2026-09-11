-- 05 — a stale rule, to show the warning
--
-- LOOK: - A Configuration Error window, naming the rule and what to write instead.

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 14.0
config.enable_tab_bar = false
config.window_padding = { left = 16, right = 16, top = 16, bottom = 16 }
config.initial_cols = 76
config.initial_rows = 22
config.check_for_updates = false
config.audible_bell = 'Disabled'

config.track_bold_and_dim_separately = true
config.dim_opacity = 0.5

config.font_rules = {
  {
    intensity = 'Half',
    font = wezterm.font('JetBrains Mono', { weight = 'Light' }),
  },
}

return config
