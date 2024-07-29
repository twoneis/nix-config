{ config, ... }: let
  inherit (config.keys) up down left right;
in {
  input = {
      keyboard = { 
          xkb = {
            layout = "us,custom";
            options = "compose:ralt";
          };
      };
      touchpad = {
          tap = true;
          natural-scroll = true;
          dwt = true;
      };
      power-key-handling.enable = false;
  };

  outputs = {
    "eDP-1" = {
        scale = 1.25;
        mode = {
          width = 2736;
          height = 1824;
          refresh = 59.959;
        };
    };

    "DP-1"  = {
        scale = 1.0;
        mode = {
          width = 5120;
          height = 2160;
          refresh = 59.940;
        };
    };
  };

  layout = {
      focus-ring = {
          width = 4;
          active.gradient = {
            to=config.theme.rose;
            from=config.theme.pine;
            angle=135;
          };
          inactive.color = config.theme.iris;
      };

      preset-column-widths = [
        { proportion = 0.25; }
        { proportion = 0.5; }
        { proportion = 0.75; }
      ];

      default-column-width = { proportion = 0.5; };
      gaps = 16;
  };

  window-rules = [
    {
      geometry-corner-radius = {
        top-left = 8.0;
        top-right = 8.0;
        bottom-left = 8.0;
        bottom-right= 8.0;
      };
      clip-to-geometry = true;
    }
  ];

  prefer-no-csd = true;

  screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d-%H-%M-%S.png";

  hotkey-overlay.skip-at-startup = true;

  environment."DISPLAY" = ":0";

  spawn-at-startup = [
    { command = ["waybar"]; }
    { command = ["brightnessctl" "s" "50%"]; }
    { command = ["swaybg" "-i" "${./wallpaper.png}"]; }
    { command = ["swayidle" "-w" "before-sleep" "swaylock"]; }
  ];

  binds = {
    # Shortcuts
    "Mod+A".action.spawn = "alacritty";
    "Mod+B".action.spawn = "firefox";
    "Mod+D".action.spawn = ["fuzzel" "-I" "-T" "alacritty" "-p" ""];

    "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "-l" "1" "@DEFAULT_AUDIO_SINK@" "5%+"];
    "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];
    "XF86AudioMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];

    "XF86MonBrightnessDown".action.spawn = ["brightnessctl" "s" "5%-"];
    "XF86MonBrightnessUp".action.spawn = ["brightnessctl" "s" "5%+"];

    "Mod+Backspace".action.close-window = [];
    "Mod+K".action.center-column = [];

    # Move focus
    "Mod+Up".action.focus-window-up = [];
    "Mod+Down".action.focus-window-down = [];
    "Mod+Left".action.focus-column-left = [];
    "Mod+Right".action.focus-column-right = [];

    "Mod+${up}".action.focus-window-up = [];
    "Mod+${down}".action.focus-window-down = [];
    "Mod+${left}".action.focus-column-left = [];
    "Mod+${right}".action.focus-column-right = [];

    # Move column/window
    "Mod+Shift+Up".action.move-window-up = [];
    "Mod+Shift+Down".action.move-window-down = [];
    "Mod+Shift+Left".action.move-column-left = [];
    "Mod+Shift+Right".action.move-column-right = [];

    "Mod+Shift+${up}".action.move-window-up = [];
    "Mod+Shift+${down}".action.move-window-down = [];
    "Mod+Shift+${left}".action.move-column-left = [];
    "Mod+Shift+${right}".action.move-column-right = [];

    # Move monitor focus
    "Mod+Ctrl+Up".action.focus-monitor-up = [];
    "Mod+Ctrl+Down".action.focus-monitor-down = [];
    "Mod+Ctrl+Left".action.focus-monitor-left = [];
    "Mod+Ctrl+Right".action.focus-monitor-right = [];

    "Mod+Ctrl+${up}".action.focus-monitor-up = [];
    "Mod+Ctrl+${down}".action.focus-monitor-down = [];
    "Mod+Ctrl+${left}".action.focus-monitor-left = [];
    "Mod+Ctrl+${right}".action.focus-monitor-right = [];
    # Move columns between monitors
    "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [];
    "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [];
    "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [];
    "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [];

    "Mod+Shift+Ctrl+${up}".action.move-column-to-monitor-up = [];
    "Mod+Shift+Ctrl+${down}".action.move-column-to-monitor-down = [];
    "Mod+Shift+Ctrl+${left}".action.move-column-to-monitor-left = [];
    "Mod+Shift+Ctrl+${right}".action.move-column-to-monitor-right = [];

    # Stack windows
    "Mod+BracketLeft".action.consume-window-into-column = [];
    "Mod+BracketRight".action.expel-window-from-column = [];

    # Resize windows
    "Mod+Z".action.switch-preset-column-width = [];
    "Mod+F".action.maximize-column = [];
    "Mod+Shift+F".action.fullscreen-window = [];

    "Mod+Plus".action.set-column-width = "+10%";
    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Shift+Plus".action.set-window-height = "+10%";
    "Mod+Shift+Minus".action.set-window-height = "-10%";

    # Change Layout
    "Mod+Comma".action.switch-layout = "prev";
    "Mod+Period".action.switch-layout = "next";

    # Screenshot
    "Mod+Shift+P".action.screenshot = [];
    "Mod+Shift+Ctrl+P".action.screenshot-window = [];
    "Print".action.screenshot-screen = [];

    # Exit
    "Mod+Shift+L".action.spawn = "swaylock";
    "Mod+Shift+Q".action.quit = [];
  };
}
