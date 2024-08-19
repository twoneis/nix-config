{ inputs, lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in {
  imports = [
    ./xwl-satellite.service.nix
  ];

  config = mkIf conf.niri.enable {
    nixpkgs.overlays = [
      inputs.niri.overlays.niri
    ];

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };


    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    services.logind = {
      powerKey = "ignore";
      powerKeyLongPress = "poweroff";
      lidSwitch = "suspend";
      lidSwitchDocked = "ignore";
    };

    home-manager.users.${conf.username} = {
      home.packages = with pkgs; [
        brightnessctl
        swaybg
        swayidle
        gammastep
      ];

      programs.niri = {
        settings = import ./niri.conf.nix { config = config; };
      };

      programs.fuzzel= {
        enable = true;
        settings = import ./fuzzel.conf.nix { lib = lib; config = config; };
      };

      programs.waybar = {
        enable = true;
        settings = import ./waybar.conf.nix { };
        style = (import ./waybar.css.nix { config = config; }).style;
      };

      programs.swaylock = {
        enable = true;
        package = pkgs.swaylock-effects;
        settings = import ./swaylock.conf.nix { lib = lib; config = config; };
      };

      services.mako = {
        enable = true;
        defaultTimeout = 5000;
        maxVisible = 3;
        font = "AlegreyaSans";
        backgroundColor = config.theme.base;
        borderColor = config.theme.muted;
        textColor = config.theme.text;
        borderSize = 1;
        borderRadius = 8;
        icons = false;
      };
    };
  };
}
