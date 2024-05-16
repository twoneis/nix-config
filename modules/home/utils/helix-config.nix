{
  theme = "rose_pine";

  editor = {
    line-number = "relative";
    cursorline = true;
    soft-wrap.enable = true;
    color-modes = true;
    whitespace.render = "all";

    indent-guides = {
      render = true;
      skip-levels = 1;
    };

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
    h = "move_char_left";
    t = "move_line_up";
    n = "move_line_down";
    s = "move_char_right";

    C-n = "search_next";
    C-t = "search_prev";
  };
}
