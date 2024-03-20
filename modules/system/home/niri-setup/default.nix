{ lib, osConfig, pkgs, ... }: lib.mkIf (osConfig.withNiri) {
  home.packages = with pkgs; [
    polkit_gnome
  ];

  programs.fuzzel= {
    enable = true;
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
      line-uses-inside = true;
    };
  };
}
