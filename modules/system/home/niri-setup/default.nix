{ pkgs, ... }: {
  programs.fuzzel= {
    enable = true;
    settings = {
      colors = {
        background = "191724ee";
        text = "e0def4ff";
        match = "eb6f92ff";
        selection = "524f67ee";
        selection-text = "e0def4ff";
        selection-match = "eb6f92ff";
        border = "26233aff";
      };
    };
  };
}
