{ lib, config, pkgs, ... }: lib.mkIf (config.withGames) {
  programs.steam = {
    enable = true;
  };

  programs.gamescope = {
    enable = true;
  };
}
