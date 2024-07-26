{ config, lib, pkgs, ... }: lib.mkIf config.full {

  home-manager.users.${config.username} = {
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
