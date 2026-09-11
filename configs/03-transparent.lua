-- 03 — translucent window, dim fade compositing
-- LOOK: - Dim text lets the desktop through.
-- LOOK: - Move a bright window behind this one. It shows through the faded
-- LOOK:   letters, which a blend toward the background could not do.
-- LOOK: - Blinking text and blinking cursor behave correctly
-- LOOK:   on translucent background.

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
config.window_background_opacity = 0.65
config.default_cursor_style = 'BlinkingBlock'

return config
