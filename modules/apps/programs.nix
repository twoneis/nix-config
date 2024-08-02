{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in {
  imports = [
    ./firefox.nix
  ];

  config = mkIf conf.apps.enable {
    services = {
      # Needed for some features in nautilus such as auto-mounting and trash
      gvfs.enable = true;
    };

    home-manager.users.${conf.username} = {
      home.packages = with pkgs; [
        signal-desktop
        vesktop
        fractal
        snapshot
        nautilus
        libreoffice-qt6-fresh
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
