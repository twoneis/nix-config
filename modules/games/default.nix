{ lib, config, pkgs, ... }: lib.mkIf (config.withGames) {
  environment.systemPackages = with pkgs; [
    gamescope
    prismlauncher
    itch
    minigalaxy
  ];

  programs.steam = {
    enable = true;
  };
}
