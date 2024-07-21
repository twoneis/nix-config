{ inputs, lib, config, pkgs, ... }: lib.mkIf config.withNiri {
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  home-manager.users.${config.username} = {
    home.packages = with pkgs; [
      brightnessctl
      swaybg
      xwayland-satellite
      xwayland
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

    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = import ./swaylock.conf.nix { lib = lib; config = config; };
    };
  };
}
