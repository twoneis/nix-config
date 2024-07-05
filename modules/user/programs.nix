{ lib, config, pkgs, ... }: {
  imports = [
    ./firefox.nix
  ];

  config = lib.mkIf config.user {
    networking.firewall.allowedTCPPorts = [
      57621 # spotifyd
    ];

    services = {
      # Needed for some features in nautilus such as auto-mounting and trash
      gvfs.enable = true;
    };

    home-manager.users.twoneis = {
      home.packages = with pkgs; [
        signal-desktop
        vesktop
        fractal
        loupe
        snapshot
        gnome.nautilus
        libreoffice-qt6-fresh
        freecad
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

      services.spotifyd = {
        enable = true;
        settings = {
          global = {
            device_name = config.networking.hostName;
            bitrate = 320;
            volume_normalisation = true;
            autoplay = false;
            zeroconf_port = 57621;
          };
        };
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
