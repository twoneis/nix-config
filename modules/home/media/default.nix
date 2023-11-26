{ pkgs, ... }: {
  home.packages = with pkgs; [
    vlc
    spotifywm
    image-roll
  ];
}
