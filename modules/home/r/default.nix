{ pkgs, ... }: {
  home.packages = with pkgs; [
    R
    rstudioWrapper
    pandoc
    texlive.combined.scheme-full
  ];
}
