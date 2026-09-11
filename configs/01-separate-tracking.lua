-- 01 — track_bold_and_dim_separately = true
-- LOOK: - `bold, then dim` and `dim, then bold` are now identical.
-- LOOK: - Dim is faded at 0.5 and renders at normal font weight.
-- LOOK: - Bold uses brighter colors even when it's dim.

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

return config
