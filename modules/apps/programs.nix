{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
  mkXwlWrapper = import ../niri/xwl-wrapper.nix;
  time = pkgs.makeDesktopItem {
    name = "peaclock-desktop";
    desktopName = "Time";
    exec = "alacritty -e ${pkgs.peaclock}/bin/peaclock";
  };
in mkIf conf.apps.enable {
  services = {
    # Needed for some features in nautilus such as auto-mounting and trash
    gvfs.enable = true;
  };

  home-manager.users.${conf.username} = {
    home.packages = with pkgs; [
      signal-desktop
      vesktop
      snapshot
      nautilus
      inkscape
      # blender
      gnome-disk-utility
      fragments
      element-desktop
      tor-browser
      libreoffice-qt6
      chromium
      peaclock
      element-desktop
    ] ++ [
      time
      (mkXwlWrapper { pkgs = pkgs; name = "Prusa"; pkg = "prusa-slicer"; })
      (mkXwlWrapper { pkgs = pkgs; name = "Vial"; pkg = "vial"; })
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
      settings = import ./alacritty.conf.nix { config = config; };
    };
  };
}
