{ inputs, lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
  swayosd-style = pkgs.writeText "swayosd.css" 
    (import ./swayosd.css.nix { config = config; }).style;
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

    environment.systemPackages = [
      (pkgs.where-is-my-sddm-theme.override ({
        themeConfig = (import ./sddm.theme.nix { config = config; }).style;
        variants = [ "qt5" ];
      }))
    ];

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "where_is_my_sddm_theme_qt5";
    };

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    services.upower = {
      enable = true;
    };

    services.logind = {
      powerKey = "ignore";
      powerKeyLongPress = "poweroff";
      lidSwitch = "suspend";
      lidSwitchDocked = "suspend";
      lidSwitchExternalPower = "suspend";
    };

    home-manager.users.${conf.username} = {
      home.packages = with pkgs; [
        swayidle
      ];

      services.swayosd = {
        enable = true;
        topMargin = 0.8;
        stylePath = swayosd-style; 
      };

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
        package = (pkgs.swaylock-effects.overrideAttrs (final: prev: {
          buildInputs = prev.buildInputs ++ [ pkgs.wayland-scanner ];
        }));
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
