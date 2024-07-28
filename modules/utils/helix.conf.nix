{ config, ... }: {
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
    ${config.keys.up} = "move_line_up";
    ${config.keys.down} = "move_line_down";
    ${config.keys.left} = "move_char_left";
    ${config.keys.right} = "move_char_right";

    C-n = "search_next";
    C-t = "search_prev";
  };

  keys.select = {
    ${config.keys.up} = "extend_line_up";
    ${config.keys.down} = "extend_line_down";
    ${config.keys.left} = "extend_char_left";
    ${config.keys.right} = "extend_char_right";
  };
}
