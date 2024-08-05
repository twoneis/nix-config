{ config, ... }: let
  inherit (config.conf) keys;
in {
  theme = "rose_pine";

  editor = {
    line-number = "relative";
    cursorline = true;
    soft-wrap.enable = true;
    color-modes = true;
    whitespace.render = "all";

    auto-format = true;

    lsp = {
      display-inlay-hints = true;
    };

    gutters = [ "diagnostics" "line-numbers" "diff" ];

    statusline = {
      left = [ "mode" "spinner" "version-control" ];
      center = [ "file-modification-indicator" "read-only-indicator" "file-name" ];
      right = [ "diagnostics" "position" ];
    };

    cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };
  };

  keys.normal  = {
    ${keys.up} = "move_line_up";
    ${keys.down} = "move_line_down";
    ${keys.left} = "move_char_left";
    ${keys.right} = "move_char_right";

    "C-${keys.up}" = "search_prev";
    "C-${keys.down}" = "search_next";
  };

  keys.select = {
    ${keys.up} = "extend_line_up";
    ${keys.down} = "extend_line_down";
    ${keys.left} = "extend_char_left";
    ${keys.right} = "extend_char_right";
  };
}
