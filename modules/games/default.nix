{ lib, config, ... }: lib.mkIf (config.withGames) {
  programs.steam = {
    enable = true;
  };

  programs.gamescope = {
    enable = true;
  };

  programs.gamemode.enable = true;
}
