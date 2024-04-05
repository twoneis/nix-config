{ pkgs, ... }: {
  home.packages = with pkgs; [
    spotify
    image-roll
  ];

  programs.mpv = {
    enable = true;
  };
}
