{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf mkMerge;
in mkIf config.withGames (mkMerge [
  (mkIf config.withImpermanence {
    environment.persistence."/persist".users.${config.username}= {
      directories = [
        "Games"
        ".steam"
        ".local/share/PrismLauncher"
      ];
    };
  }) {
    programs.steam.enable = true;
    programs.gamemode.enable = true;

    home-manager.users.${config.username} = {
      home.packages = with pkgs; [
        prismlauncher
      ];
    };
  }
])
