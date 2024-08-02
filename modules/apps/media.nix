{ config, lib, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.apps.enable {

  home-manager.users.${conf.username} = {
    home.packages = with pkgs; [
      loupe
      spotify
      amberol
    ];

    programs.mpv = {
      enable = true;
    };
  };
}
