{ pkgs, ... }: {
  home.packages = with pkgs; [
    steam
    prismlauncher-qt5
    lutris
    winePackages.stagingFull
    r2modman
  ];
}
