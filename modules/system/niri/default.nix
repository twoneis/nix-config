{ lib, config, pkgs, ... }: lib.mkIf (config.withNiri) {
  programs.niri.enable = true;
  home-manager.users.twoneis = {
    programs.niri = {
      settings = {
        input = {
            keyboard = { 
                xkb = { };
            };
            touchpad = {
                tap = true;
                natural-scroll = true;
            };
            tablet = {
                map-to-output = "DP-3";
            };
            touch = {
                map-to-output = "eDP-1";
            };
            power-key-handling.enable = false;
        };
        outputs."eDP-1" = {
            scale = 1.0;
            mode = {
              width = 1920;
              height = 1080;
              refresh = 60.00;
            };
            position = {
              x=1280;
              y=0 ;
            };
        };

        outputs."DP-1"  = {
            scale = 1.0;
            mode = {
              width = 5120;
              height = 2160;
              refresh = 59.940;
            };
            position = {
              x=1280;
              y=0;
            };
        };

        layout = {
            focus-ring = {
                width = 4;
                active-gradient = {
                  from="#31748f";
                  to="#9ccfd8";
                  angle=135;
                };
                inactive-color = "#c4a7e7";
            };

            preset-column-widths = [
              { proportion = 0.25; }
              { proportion = 0.5; }
              { proportion = 0.75; }
            ];

            default-column-width = { proportion = 0.25; };
            gaps = 4;
        };

        prefer-no-csd = true;

        screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d-%H-%M-%S.png";

        hotkey-overlay.skip-at-startup = true;

        spawn-at-startup = [
          { command = ["waybar"]; }
          { command = ["swaybg" "-i" "${../../../wallpaper/wallpaper.png}" "-m" "fill"]; }
        ];

        binds = {
          "Mod+T".spawn = "alacritty";
          "Mod+B".spawn = "firefox";
          "Mod+S".spawn = ["fuzzel" "-I"];

          "XF86AudioRaiseVolume".spawn = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
          "XF86AudioLowerVolume".spawn = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";

          "Mod+Backspace".close-window = [];

          "Mod+Left".focus-column-left = [];
          "Mod+Right".focus-column-right = [];
          "Mod+Up".focus-window-up = [];
          "Mod+Down".focus-window-down = [];
          "Mod+Comma".focus-column-left = [];
          "Mod+Period".focus-column-right = [];
          "Mod+E".focus-window-up = [];
          "Mod+O".focus-window-down = [];

          "Mod+Shift+Left".move-column-left = [];
          "Mod+Shift+Right".move-column-right = [];
          "Mod+Shift+Up".move-window-up = [];
          "Mod+Shift+Down".move-window-down = [];
          "Mod+Shift+Comma".move-column-left = [];
          "Mod+Shift+Period".move-column-right = [];
          "Mod+Shift+E".move-window-up = [];
          "Mod+Shift+O".move-window-down = [];

          "Mod+Ctrl+Left".focus-monitor-left = [];
          "Mod+Ctrl+Right".focus-monitor-right = [];
          "Mod+Ctrl+Up".focus-monitor-up = [];
          "Mod+Ctrl+Down".focus-monitor-down = [];
          "Mod+Ctrl+Comma".focus-monitor-left = [];
          "Mod+Ctrl+Period".focus-monitor-right = [];
          "Mod+Ctrl+E".focus-monitor-up = [];
          "Mod+Ctrl+O".focus-monitor-down = [];

          "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = [];
          "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = [];
          "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = [];
          "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = [];
          "Mod+Shift+Ctrl+Comma".move-column-to-monitor-left = [];
          "Mod+Shift+Ctrl+Period".move-column-to-monitor-right = [];
          "Mod+Shift+Ctrl+E".move-column-to-monitor-up = [];
          "Mod+Shift+Ctrl+O".move-column-to-monitor-down = [];

          "Mod+P".consume-window-into-column = [];
          "Mod+Shift+P".expel-window-from-column = [];

          "Mod+Z".switch-preset-column-width = [];
          "Mod+F".maximize-column = [];
          "Mod+Shift+F".fullscreen-window = [];
          "Mod+K".center-column = [];

          "Mod+Plus".set-column-width = "+10%";
          "Mod+Minus".set-column-width = "-10%";
          "Mod+Shift+Plus".set-window-height = "+10%";
          "Mod+Shift+Minus".set-window-height = "-10%";

          "Mod+Shift+S".screenshot = [];
          "Mod+Shift+Ctrl+S".screenshot-window = [];
          "Print".screenshot-screen = [];

          "Mod+Shift+L".spawn = "swaylock";
          "Mod+Shift+Q".quit = [];
        };
      };
    };
  };
}
