{ pkgs, ... }: {
  home.packages = with pkgs; [
    vlc
    psst
    image-roll
  ];
}
