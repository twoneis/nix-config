{ lib, config, pkgs, ... }: lib.mkIf (config.withNiri) {
  programs.niri.enable = true;

  home-manager.users.twoneis = {
    home.packages = with pkgs; [
      brightnessctl
      swaybg
    ];

    programs.niri = {
      settings = import ./niri-settings.nix { config = config; };
    };

    programs.fuzzel= {
      enable = true;
      settings = import ./fuzzel-settings.nix { lib = lib; config = config; };
    };

    programs.waybar = {
      enable = true;
      settings = import ./waybar-settings.nix { config = config; };
      style = builtins.readFile(./waybar.css);
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
      settings = import ./swaylock-settings.nix { lib = lib; config = config; };
    };
  };
}
