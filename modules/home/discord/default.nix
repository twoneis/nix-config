{ ... }: {
  programs.discoss = {
    enable = true;
    css = import ./rosepine.css;
  };
}
