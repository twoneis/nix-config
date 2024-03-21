{ lib, osConfig, pkgs, ... }: lib.mkIf (osConfig.withNiri) {
  home.packages = with pkgs; [
    polkit_gnome
    swaybg
  ];

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

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [
          
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "battery"
        ];
      };
    };
  };

  services.mako = {
    enable = true;
    backgroundColor = "#191724ee";
    borderColor = "#26233a";
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      ignore-empty-password = true;
      screenshots = true;
      clock = true;
      submit-on-touch = true;
      indicator = true;
      indicator-caps-lock = true;
      indicator-radius = 100;
      indicator-thickness = 4;
      inside-color = "#26233aaa";
      inside-clear-color = "#908caaaa";
      inside-caps-lock-color = "#ebbcbaaa";
      inside-ver-color = "#9ccfd8aa";
      inside-wrong-color = "#eb6f92aa";
      line-uses-inside = true;
      ring-color = "#1f1d2e";
      ring-clear-color = "#6e6a86";
      ring-caps-lock-color = "#f6c177";
      ring-ver-color = "#31748f";
      ring-wrong-color = "#eb6f92";
      seperator-color = "#191724";
      key-hl-color = "#c4a7e7";
      bs-hl-color = "#eb6f92";
      caps-lock-key-hl-color = "#c4a7e7";
      caps-lock-bs-hl-color = "#eb6f92";
      text-color = "#e0def4";
      text-clear-color = "#e0def4";
      text-caps-lock-color = "#e0def4";
      text-ver-color = "#e0def4";
      text-wrong-color = "#e0def4";
      effect-blur = "30x10";
    };
  };
}
