{ pkgs, ... }: {
  home.packages = with pkgs; [
    vlc
    spotify
    image-roll
  ];
}
