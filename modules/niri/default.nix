{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./xwl-satellite.service.nix
  ];

  config = lib.mkIf config.withNiri {
    nixpkgs.overlays = [ inputs.niri.overlays.niri ];

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    services.logind = {
      powerKey = "poweroff";
      lidSwitch = "suspend";
    };

    home-manager.users.${config.username} = {
      home.packages = with pkgs; [
        brightnessctl
        swaybg
        swayidle
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
        settings = import ./waybar.conf.nix { config = config; };
        style = builtins.readFile(./waybar.conf.css);
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
