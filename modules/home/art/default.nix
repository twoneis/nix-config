{ pkgs, ... }: {
  home.packages = with pkgs; [
    calibre
    krita
  ];
}
