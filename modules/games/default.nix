{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf mkMerge;
  inherit (config) conf;
  holo-script = pkgs.writeShellApplication {
    name = "holo-script";
    runtimeInputs = [ pkgs.steam pkgs.gamescope ];
    text = ''
      gamescope -f -h 1504 -w 2256 -r 60 -F fsr -e -- steam
    '';
  };
  holo = pkgs.makeDesktopItem {
    name = "holo";
    desktopName = "Holo";
    exec = "${holo-script}/bin/holo-script";
  };
in mkIf conf.games.enable (mkMerge [
  (mkIf conf.impermanence.enable {
    environment.persistence."/persist".users.${conf.username}= {
      directories = [
        "Games"
        ".steam"
        ".local/share/PrismLauncher"
      ];
    };
  }) {
    programs.steam.enable = true;
    programs.gamescope.enable = true;
    programs.gamemode.enable = true;

    home-manager.users.${conf.username} = {
      home.packages = [
        pkgs.prismlauncher
        pkgs.heroic
        holo
      ];
    };
  }
])
