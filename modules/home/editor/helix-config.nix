{
  theme = "rosepine";

  editor = {
    line-number = "relative";
    cursorline = true;
    auto-format = true;
    soft-wrap.enable = true;

    whitespace.render = "all";

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
  };
}
