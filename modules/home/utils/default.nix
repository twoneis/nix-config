{ pkgs, ... }: {
  home.packages = with pkgs; [
    man-pages
    man-pages-posix
    gnome.nautilus
  ];

  programs.bottom = {
    enable = true;
  };
}
