{ lib, config, pkgs, ... }: lib.mkIf config.withGames {
  programs.steam.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  home-manager.users.twoneis = {
    home.packages = with pkgs; [
      lutris
    ];
  };
}
