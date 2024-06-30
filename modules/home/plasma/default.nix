{ pkgs, ... }: {
programs.plasma = {
  enable = true;

  workspace = {
    clickItemTo = "open"; # If you liked the click-to-open default from plasma 5
    lookAndFeel = "org.kde.breezedark.desktop";
    cursor = {
      theme = "Bibata-Modern-Ice";
      size = 32;
    };
    iconTheme = "Papirus-Dark";
    wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
  };

  hotkeys.commands."launch-konsole" = {
    name = "Launch Konsole";
    key = "Meta+Alt+K";
    command = "konsole";
  };

  fonts = {
    general = {
      family = "JetBrains Mono";
      pointSize = 12;
    };
  };

  panels = [
    # Windows-like panel at the bottom
    {
      location = "bottom";
      widgets = [
        {
          name = "org.kde.plasma.kickoff";
          config = {
            General.icon = "nix-snowflake-white";
          };
        }
        {
          name = "org.kde.plasma.icontasks";
          config = {
            General.launchers = [
              "applications:org.kde.dolphin.desktop"
              "applications:org.kde.konsole.desktop"
            ];
          };
        }
        "org.kde.plasma.marginsseparator"
        {
          digitalClock = {
            calendar.firstDayOfWeek = "sunday";
            time.format = "12h";
          };
        }
        {
          systemTray.items = {
            shown = [
              "org.kde.plasma.battery"
              "org.kde.plasma.bluetooth"
            ];
            hidden = [
              "org.kde.plasma.networkmanagement"
              "org.kde.plasma.volume"
            ];
          };
        }
      ];
      hiding = "autohide";
    }
    {
      location = "top";
      height = 26;
      widgets = [
        "org.kde.plasma.appmenu"
      ];
    }
  ];

  window-rules = [
      {
        description = "Dolphin";
        match = {
          window-class = {
            value = "dolphin";
            type = "substring";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
          maximizehoriz = true;
          maximizevert = true;
        };
      }
    ];
    shortcuts = {
      ksmserver = {
        "Lock Session" = [ "Screensaver" "Meta+Ctrl+Alt+L" ];
      };

      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+L";
        "Switch Window Up" = "Meta+K";
      };
    };

    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;
      kwinrc."org.kde.kdecoration2".ButtonsOnLeft = "SF";
      kwinrc.Desktops.Number = {
        value = 8;
        immutable = true;
      };
      kscreenlockerrc = {
        Greeter.WallpaperPlugin = "org.kde.potd";
        "Greeter/Wallpaper/org.kde.potd/General".Provider = "bing";
      };
    };
  };
}
