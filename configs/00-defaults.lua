-- 00 — default config
-- LOOK: - `bold, then dim` differs from `dim, then bold`. The second code won
-- LOOK:   and the first was thrown away.
-- LOOK: - Dim rows take a lighter font.

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 14.0
config.enable_tab_bar = false
config.window_padding = { left = 16, right = 16, top = 16, bottom = 16 }
config.initial_cols = 76
config.initial_rows = 22
config.check_for_updates = false
config.audible_bell = 'Disabled'

return config
