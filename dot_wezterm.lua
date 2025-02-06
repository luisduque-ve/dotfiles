local wezterm = require("wezterm")

return {
  disable_default_key_bindings = true,
  color_scheme = 'Gruvbox Dark (Gogh)',
  font = wezterm.font({
    family = "FiraCode Nerd Font Mono",
  }),
  font_size = 19.0,
  hide_tab_bar_if_only_one_tab = true,
  window_close_confirmation = "NeverPrompt",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  tab_bar_at_bottom = true,
  max_fps = 240,
}
