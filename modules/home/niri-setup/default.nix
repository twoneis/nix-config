{ lib, osConfig, pkgs, ... }: let
  theme = import ../../colors.nix;
in lib.mkIf (osConfig.withNiri) {
  programs.fuzzel= {
    enable = true;
    settings = {
      colors = with lib; with strings; {
        background = concatStrings [ theme.base.hex "ee" ];
        text = concatStrings [ theme.text.hex "ff" ];
        match = concatStrings [ theme.gold.hex "ff" ];
        selection = concatStrings [theme.highlight-med.hex "ee" ];
        selection-text = concatStrings [ theme.text.hex "ff" ];
        selection-match = concatStrings [ theme.gold.hex "ff" ];
        border = concatStrings [ theme.overlay.hex "ff" ];
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
          "memory"
          "cpu"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "network"
          "wireplumber"
          "battery"
        ];
        "cpu" = {
          interval = 10;
          format = "{usage}% ";
        };
        "memory" = {
          interval = 30;
          format = "{percentage}% ";
        };
        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%a, %Y-%m-%d}";
        };
        "battery" = {
          states = {
            good = 80;
            warning = 50;
            critical = 20;
          };
          format = "{icon}";
          format-alt = "{capacity}%";
          format-icons = ["" "" "" "" ""];
          tooltip = false;
        };
        "network" = {
          format-wifi = "{icon}";
          format-alt = "{essid}";
          format-ethernet = "󰈁";
          format-disconnected = "󰤭";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          tooltip = false;
        };
        "wireplumber" = {
          format = "{icon}";
          format-alt = "{volume}%";
          format-muted = "";
          format-icons = ["" "" ""];
          tooltip = false;
        };
      };
    };
    style = builtins.readFile(./waybar.css);
  };

  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    maxHistory = 20;
    maxVisible = 3;
    font = "AlegreyaSans";
    backgroundColor = theme.base.hex;
    borderColor = theme.muted.hex;
    textColor = theme.text.hex;
    borderSize = 1;
    borderRadius = 8;
    icons = false;
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = with lib; with strings; {
      ignore-empty-password = true;
      screenshots = true;
      clock = true;
      submit-on-touch = true;
      indicator = true;
      indicator-caps-lock = true;
      indicator-radius = 100;
      indicator-thickness = 4;
      inside-color = concatStrings [ theme.overlay.hex "aa" ];
      inside-clear-color = concatStrings [ theme.subtle.hex "aa" ];
      inside-caps-lock-color = concatStrings [ theme.rose.hex "aa" ];
      inside-ver-color = concatStrings [ theme.foam.hex "aa" ];
      inside-wrong-color = concatStrings [ theme.love.hex "aa" ];
      line-uses-inside = true;
      ring-color = theme.surface.hex;
      ring-clear-color = theme.muted.hex;
      ring-caps-lock-color = theme.gold.hex;
      ring-ver-color = theme.pine.hex;
      ring-wrong-color = theme.love.hex;
      seperator-color = theme.base.hex;
      key-hl-color = theme.iris.hex;
      bs-hl-color = theme.love.hex;
      caps-lock-key-hl-color = theme.iris.hex;
      caps-lock-bs-hl-color = theme.love.hex;
      text-color = theme.text.hex;
      text-clear-color = theme.text.hex;
      text-caps-lock-color = theme.text.hex;
      text-ver-color = theme.text.hex;
      text-wrong-color = theme.text.hex;
      effect-blur = "30x10";
    };
  };
}
