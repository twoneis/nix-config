{ lib, config, pkgs, ... }: lib.mkIf config.withGames {
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  home-manager.users.${config.username} = {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}
