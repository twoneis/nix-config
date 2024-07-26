{ config, lib, pkgs, ... }: lib.mkIf config.full {

  home-manager.users.${config.username} = {
    home.packages = with pkgs; [
      loupe
      spotify
    ];

    programs.mpv = {
      enable = true;
    };

    services.mopidy = {
      enable = true;
      extensionPackages = with pkgs; [
        mopidy-mpd
        mopidy-mpris
        mopidy-muse
        mopidy-spotify
        mopidy-local
      ];
    };
  };
}
