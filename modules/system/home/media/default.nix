{ pkgs, ... }: {
  home.packages = with pkgs; [
    spotify
    image-roll
    mopidy-muse
  ];

  services.mopidy = {
    enable = true;
    extensionPackages = with pkgs; [
      mopidy-local
      mopidy-tidal
      mopidy-spotify
      mopidy-tidal
    ];
  };

  programs.mpv = {
    enable = true;
  };
}
