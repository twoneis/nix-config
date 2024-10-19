{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
  mkXwlWrapper = import ../niri/xwl-wrapper.nix;
  holo-script = pkgs.writeShellApplication {
    name = "holo-script";
    runtimeInputs = [ pkgs.steam pkgs.gamescope ];
    text = ''
      gamescope -f -r 60 -h 1080 -F fsr -e --mangoapp -- steam -tenfoot
    '';
  };
  holo = pkgs.makeDesktopItem {
    name = "Steam Big Picture";
    desktopName = "Steam Big Picture";
    exec = "${holo-script}/bin/holo-script";
  };
  steam-wrapped = mkXwlWrapper {
    pkgs = pkgs;
    name = "Steam Wrapped";
    pkg = "steam";
  };
in mkIf conf.games.enable {
  programs.steam.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  environment.sessionVariables = {
    MANGOHUD_CONFIGFILE = "$HOME/.config/MangoHud/MangoHud.conf";
    MANGOHUD_CONFIG = "read_cfg";
  };

  home-manager.users.${conf.username} = {
    home.packages = [
      pkgs.prismlauncher
      holo
      steam-wrapped
    ];

    programs.mangohud = {
      enable = true;
      settings = {
        gamemode = true;
        refresh_rate = true;
        fsr = true;
        resolution = true;
      };
    };
  };
}
