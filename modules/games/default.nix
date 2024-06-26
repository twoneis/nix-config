{ lib, config, pkgs, ... }: lib.mkIf (config.withGames) {
  programs.steam = {
    enable = true;
    gamescopeSession.enabe = true;
  };

  programs.gamescope = {
    enable = true;
  };

  programs.gamemode.enable = true;
}
