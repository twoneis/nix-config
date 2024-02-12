{ pkgs, ... }: {
  home.packages = with pkgs; [
    man-pages
    man-pages-posix
  ];

  programs.alacritty = {
    enable = true;
    settings = import ./alacritty-config.nix;
  };
}
