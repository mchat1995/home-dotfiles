local wezterm = require 'wezterm';
return {
  enable_wayland = true,
  front_end = "OpenGL",
  window_background_opacity = 0.5,
  font_size = 11.0,
  tab_bar_at_bottom = true,
  color_scheme = "nord",
font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "Iosevka",
    "Fira Code",
    "adobe-source-han-sans-jp-fonts",
  }),
check_for_updates = false,
automatically_reload_config = true,
default_cursor_style = "BlinkingBlock",
}
