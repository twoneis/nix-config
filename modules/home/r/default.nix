{ pkgs, ... }: {
  home.packages = with pkgs; [
    R
    rstudio
    pandoc
    texlive.combined.scheme-full
  ];
}
