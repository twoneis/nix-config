{ pkgs }: {
  environment.systemPackages = with pkgs; [
    alacritty
    git
    gh
    man-pages
    man-pages-posix
    bottom
    firefox
    gnome.nautilus
    vlc
    image-roll
  ];
}
