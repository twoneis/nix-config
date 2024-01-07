{ pkgs, ... }: {
  home.packages = with pkgs; [
    signal-desktop
    fractal
  ];
}
