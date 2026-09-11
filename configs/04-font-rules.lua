-- 04 — font rules written in the new vocabulary
-- LOOK: - We're using italic family for dim text.
-- LOOK: - Bold-dim text correctly matches its rule.

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
    bold = true,
    dim = true,
    font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true }),
  },
  {
    bold = false,
    dim = true,
    font = wezterm.font('JetBrains Mono', { italic = true }),
  },
}

return config
