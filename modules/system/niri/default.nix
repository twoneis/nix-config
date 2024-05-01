{ lib, config, pkgs, ... }: lib.mkIf (config.withNiri) {
  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    brightnessctl
    swaybg
    pamixer
  ];
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
              width = 2736;
              height = 1824;
              refresh = 59.959;
            };
            position = {
              x=0;
              y=1200;
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
              x=0;
              y=0;
            };
        };

        layout = {
            focus-ring = {
                width = 4;
                active.gradient = {
                  from="#31748f";
                  to="#9ccfd8";
                  angle=135;
                };
                inactive.color = "#c4a7e7";
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
          { command = ["pamixer" "--set-volume" "0"]; }
          { command = ["brightnessctl" "s" "50%"]; }
          { command = ["systemctl" "--user" "restart" "spotifyd.service"]; }
        ];

        binds = {
          "Mod+T".action.spawn = "alacritty";
          "Mod+B".action.spawn = "firefox";
          "Mod+S".action.spawn = ["fuzzel" "-I" "-T" "alacritty" "-p" ""];

          "XF86AudioRaiseVolume".action.spawn = ["pamixer" "-i" "5"];
          "XF86AudioLowerVolume".action.spawn = ["pamixer" "-d" "5"];
          "XF86MonBrightnessDown".action.spawn = ["brightnessctl" "-n=10%" "s" "5%-"];
          "XF86MonBrightnessUp".action.spawn = ["brightnessctl" "s" "5%+"];

          "Mod+Backspace".action.close-window = [];

          "Mod+Left".action.focus-column-left = [];
          "Mod+Right".action.focus-column-right = [];
          "Mod+Up".action.focus-window-up = [];
          "Mod+Down".action.focus-window-down = [];
          "Mod+Comma".action.focus-column-left = [];
          "Mod+Period".action.focus-column-right = [];
          "Mod+E".action.focus-window-up = [];
          "Mod+O".action.focus-window-down = [];

          "Mod+Shift+Left".action.move-column-left = [];
          "Mod+Shift+Right".action.move-column-right = [];
          "Mod+Shift+Up".action.move-window-up = [];
          "Mod+Shift+Down".action.move-window-down = [];
          "Mod+Shift+Comma".action.move-column-left = [];
          "Mod+Shift+Period".action.move-column-right = [];
          "Mod+Shift+E".action.move-window-up = [];
          "Mod+Shift+O".action.move-window-down = [];

          "Mod+Ctrl+Left".action.focus-monitor-left = [];
          "Mod+Ctrl+Right".action.focus-monitor-right = [];
          "Mod+Ctrl+Up".action.focus-monitor-up = [];
          "Mod+Ctrl+Down".action.focus-monitor-down = [];
          "Mod+Ctrl+Comma".action.focus-monitor-left = [];
          "Mod+Ctrl+Period".action.focus-monitor-right = [];
          "Mod+Ctrl+E".action.focus-monitor-up = [];
          "Mod+Ctrl+O".action.focus-monitor-down = [];

          "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [];
          "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [];
          "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [];
          "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [];
          "Mod+Shift+Ctrl+Comma".action.move-column-to-monitor-left = [];
          "Mod+Shift+Ctrl+Period".action.move-column-to-monitor-right = [];
          "Mod+Shift+Ctrl+E".action.move-column-to-monitor-up = [];
          "Mod+Shift+Ctrl+O".action.move-column-to-monitor-down = [];

          "Mod+P".action.consume-window-into-column = [];
          "Mod+Shift+P".action.expel-window-from-column = [];

          "Mod+Z".action.switch-preset-column-width = [];
          "Mod+F".action.maximize-column = [];
          "Mod+Shift+F".action.fullscreen-window = [];
          "Mod+K".action.center-column = [];

          "Mod+Plus".action.set-column-width = "+10%";
          "Mod+Minus".action.set-column-width = "-10%";
          "Mod+Shift+Plus".action.set-window-height = "+10%";
          "Mod+Shift+Minus".action.set-window-height = "-10%";

          "Mod+Shift+S".action.screenshot = [];
          "Mod+Shift+Ctrl+S".action.screenshot-window = [];
          "Print".action.screenshot-screen = [];

          "Mod+Shift+L".action.spawn = "swaylock";
          "Mod+Shift+Q".action.quit = [];
        };
      };
    };
  };
}
