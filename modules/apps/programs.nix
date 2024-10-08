{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
  mkXwlWrapper = import ../niri/xwl-wrapper.nix;
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
      ] ++ [(mkXwlWrapper { lib = lib; pkgs = pkgs; app = "${pkgs.prusa-slicer}/bin/prusa-slicer"; name = "Prusa"; })];

      home.file = {
        ".config/vesktop/settings.json" = {
          source = ./vesktop.conf.json;
        };
        ".config/vesktop/settings/settings.json" = {
          source = ./vencord.conf.json;
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
        settings = import ./alacritty.conf.nix { config = config; };
      };
    };
  };
}
