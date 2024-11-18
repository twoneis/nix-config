{ config, ... }: let
  inherit (config.conf) keys extraLayout;
in {
  input = {
      keyboard = { 
          xkb = {
            layout = if extraLayout.enable then "custom,us" else "us";
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
    # Framework builtin Display
    "BOE 0x0BCA Unknown" = {
        scale = 1;
        mode = {
          width = 2256;
          height = 1504;
          refresh = 59.999;
        };
        position = {
          x = 0;
          y = 0;
        };
        background-color = config.theme.base;
    };

    # Home Monitor
    "Microstep MSI PS341WU 0000000000000"  = {
        scale = 1;
        mode = {
          width = 5120;
          height = 2160;
          refresh = 59.940;
        };
        position = {
          x = -1280;
          y = -2160;
        };
        background-color = config.theme.base;
    };

    # Uni Monitors
    "HP Inc. HP E24i G4 6CM1090CPF" = {
      scale = 1;
      mode = {
        width = 1920;
        height = 1200;
        refresh = 59.950;
      };
      background-color = config.theme.base;
    };

    "Dell Inc. DELL U2415 7MT019A90F1U" = {
      scale = 1;
      mode = {
        width = 1920;
        height = 1200;
        refresh = 59.950;
      };
      background-color = config.theme.base;
    };
  };

  layout = {
      focus-ring = {
          width = 2;
          active.gradient = {
            to = config.theme.rose;
            from = config.theme.pine;
            in' = "oklch shorter hue";
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

      gaps = 4;
      struts = {
        top = 2;
      };
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

  spawn-at-startup = [
    { command = [ "waybar" ]; }
    { command = [ "swayidle" "-w" "before-sleep" "swaylock" ]; }
  ];

  binds = {
    # Shortcuts
    "Mod+Z".action.spawn = "alacritty";
    "Mod+B".action.spawn = "firefox";
    "Mod+Space".action.spawn = "fuzzel";

    "XF86AudioRaiseVolume".action.spawn = [ 
      "swayosd-client" "--output-volume" "raise"
    ];
    "XF86AudioLowerVolume".action.spawn = [
      "swayosd-client" "--output-volume" "lower"
    ];
    "XF86AudioMute".action.spawn = [
      "swayosd-client" "--output-volume" "mute-toggle"
    ];

    "XF86MonBrightnessDown".action.spawn = [
      "swayosd-client" "--brightness" "lower"
    ];
    "XF86MonBrightnessUp".action.spawn = [
      "swayosd-client" "--brightness" "raise"
    ];

    "Mod+Backspace".action.close-window = [];

    # Move focus
    "Mod+Up".action.focus-window-or-workspace-up = [];
    "Mod+Down".action.focus-window-or-workspace-down = [];
    "Mod+Left".action.focus-column-left = [];
    "Mod+Right".action.focus-column-right = [];

    "Mod+${keys.up}".action.focus-window-or-workspace-up = [];
    "Mod+${keys.down}".action.focus-window-or-workspace-down = [];
    "Mod+${keys.left}".action.focus-column-left = [];
    "Mod+${keys.right}".action.focus-column-right = [];

    # Move column/window
    "Mod+Shift+Up".action.move-window-up-or-to-workspace-up = [];
    "Mod+Shift+Down".action.move-window-down-or-to-workspace-down = [];
    "Mod+Shift+Left".action.move-column-left = [];
    "Mod+Shift+Right".action.move-column-right = [];

    "Mod+Shift+${keys.up}".action.move-window-up-or-to-workspace-up = [];
    "Mod+Shift+${keys.down}".action.move-window-down-or-to-workspace-down = [];
    "Mod+Shift+${keys.left}".action.move-column-left = [];
    "Mod+Shift+${keys.right}".action.move-column-right = [];

    # Move monitor focus
    "Mod+Ctrl+Up".action.focus-monitor-up = [];
    "Mod+Ctrl+Down".action.focus-monitor-down = [];
    "Mod+Ctrl+Left".action.focus-monitor-left = [];
    "Mod+Ctrl+Right".action.focus-monitor-right = [];

    "Mod+Ctrl+${keys.up}".action.focus-monitor-up = [];
    "Mod+Ctrl+${keys.down}".action.focus-monitor-down = [];
    "Mod+Ctrl+${keys.left}".action.focus-monitor-left = [];
    "Mod+Ctrl+${keys.right}".action.focus-monitor-right = [];

    # Move workspaces between monitors
    "Mod+Shift+Ctrl+Up".action.move-workspace-to-monitor-up = [];
    "Mod+Shift+Ctrl+Down".action.move-workspace-to-monitor-down = [];
    "Mod+Shift+Ctrl+Left".action.move-workspace-to-monitor-left = [];
    "Mod+Shift+Ctrl+Right".action.move-workspace-to-monitor-right = [];

    "Mod+Shift+Ctrl+${keys.up}".action.move-workspace-to-monitor-up = [];
    "Mod+Shift+Ctrl+${keys.down}".action.move-workspace-to-monitor-down = [];
    "Mod+Shift+Ctrl+${keys.left}".action.move-workspace-to-monitor-left = [];
    "Mod+Shift+Ctrl+${keys.right}".action.move-workspace-to-monitor-right = [];

    # Move workspaces
    "Mod+TouchpadScrollUp".action.move-workspace-down = [];
    "Mod+TouchpadScrollUp".cooldown-ms = 100;
    "Mod+TouchpadScrollDown".action.move-workspace-up = [];
    "Mod+TouchpadScrollDown".cooldown-ms = 100;

    # Stack windows
    "Mod+BracketLeft".action.consume-window-into-column = [];
    "Mod+BracketRight".action.expel-window-from-column = [];

    # Resize windows
    "Mod+G".action.switch-preset-column-width = [];
    "Mod+F".action.maximize-column = [];
    "Mod+Shift+F".action.fullscreen-window = [];

    "Mod+C".action.center-column = [];

    "Mod+Equal".action.set-column-width = "+10%";
    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Shift+Equal".action.set-window-height = "+10%";
    "Mod+Shift+Minus".action.set-window-height = "-10%";

    # Change Layout
    "XF86AudioMedia".action.switch-layout = "prev";

    # Screenshot
    "Mod+P".action.screenshot = [];
    "Mod+Shift+P".action.screenshot-window = [];
    "Print".action.screenshot-screen = [];

    # Exit
    "Mod+Shift+L".action.spawn = "swaylock";
    "Mod+Shift+Q".action.quit = [];
  };
}
