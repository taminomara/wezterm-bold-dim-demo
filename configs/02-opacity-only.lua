-- 02 — dim_opacity without separate tracking
-- LOOK: - Dim rows are fainter, drawn at 50% over whatever is behind them.
-- LOOK: - Dim rows use normal font weight to avoid dimming them too much.
-- LOOK: - Dim and bold are still tracked separately.

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 14.0
config.enable_tab_bar = false
config.window_padding = { left = 16, right = 16, top = 16, bottom = 16 }
config.initial_cols = 76
config.initial_rows = 2
config.check_for_updates = false
config.audible_bell = 'Disabled'
config.audible_bell = 'Disabled'

config.dim_opacity = 0.5

return config
