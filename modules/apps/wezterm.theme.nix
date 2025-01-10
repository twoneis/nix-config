{ config, ... }: let
  inherit (config) theme;
in {
  rosepine = {
    foreground = theme.text;
    background = theme.base;
    cursor_bg = theme.highlight-high;
    cursor_fg = theme.text;
    cursor_border = theme.highlight-high;
    selection_bg = "#2a283e";
    selection_fg = theme.text;
  
    ansi = [
      theme.overlay theme.love theme.pine theme.gold
      theme.foam theme.iris theme.rose theme.text
    ];

    brights = [
      theme.muted theme.love theme.pine theme.gold
      theme.foam theme.iris theme.rose theme.text
    ];

    tab_bar = {
      background = theme.base;
      active_tab = {
        bg_color = theme.overlay;
        fg_color = theme.text;
      };
      inactive_tab = {
        bg_color = theme.base;
        fg_color = theme.muted;
      };
      inactive_tab_hover = {
        bg_color = theme.overlay;
        fg_color = theme.text;
      };
      new_tab = {
        bg_color = theme.base;
        fg_color = theme.muted;
      };
      new_tab_hover = {
        bg_color = theme.overlay;
        fg_color = theme.text;
      };
      inactive_tab_edge = theme.muted;
    };
  };
}
