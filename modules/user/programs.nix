{ lib, config, pkgs, ... }: {
  imports = [
    ./firefox.nix
  ];

  config = lib.mkIf config.full {
    services = {
      # Needed for some features in nautilus such as auto-mounting and trash
      gvfs.enable = true;
    };

    home-manager.users.${config.username} = {
      home.packages = with pkgs; [
        signal-desktop
        vesktop
        fractal
        loupe
        snapshot
        nautilus
        libreoffice-qt6-fresh
        spotify
        # freecad -- broken dependency
      ];

      home.file = {
        ".config/vesktop/settings.json" = {
          source = ./vesktop.conf.json;
        };
        ".config/vesktop/settings/settings.json" = {
          source = ./vencord.conf.json;
        };
      };

      programs.pandoc = {
        enable = true;
      };

      programs.mpv = {
        enable = true;
      };

      programs.thunderbird = {
        enable = true;
        profiles = {
          "default" = {
            isDefault = true;
          };
        };
      };

      programs.alacritty = {
        enable = true;
        settings = import ./alacritty.conf.nix;
      };
    };
  };
}
