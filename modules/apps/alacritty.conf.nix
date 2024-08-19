{ config, ... }: let
  inherit (config) theme;
in {
  # Rose Pine
  colors = {
    primary = {
      foreground = theme.text;
      background = theme.base;
      dim_foreground = theme.subtle;
      bright_foreground = theme.text;
    };
    cursor = {
      text = theme.text;
      cursor = theme.highlight-high;
    };
    vi_mode_cursor = {
      text = theme.text;
      cursor = theme.highlight-high;
    };
    search = {
      matches = {
        foreground = theme.subtle;
        background = theme.overlay;
      };
      focused_match = {
        foreground = theme.base;
        background = theme.rose;
      };
    };
    hints = {
      start = {
        foreground = theme.subtle;
        background = theme.surface;
      };
      end = {
        foreground = theme.muted;
        background = theme.surface;
      };
    };
    line_indicator = {
      foreground = "None";
      background = "None";
    };
    footer_bar = {
      foreground = theme.text;
      background = theme.surface;
    };
    selection = {
      text = theme.text;
      background = theme.surface;
    };
    normal = {
      black = theme.overlay;
      red = theme.love;
      green = theme.pine;
      yellow = theme.gold;
      blue = theme.foam;
      magenta = theme.iris;
      cyan = theme.rose;
      white = theme.text;
    };
    bright = {
      black = theme.muted;
      red = theme.love;
      green = theme.pine;
      yellow = theme.gold;
      blue = theme.foam;
      magenta = theme.iris;
      cyan = theme.rose;
      white = theme.text;
    };
    dim = {
      black = theme.muted;
      red = theme.love;
      green = theme.pine;
      yellow = theme.gold;
      blue = theme.foam;
      magenta = theme.iris;
      cyan = theme.rose;
      white = theme.text;
    };
  };

  window.decorations = "None";
}
