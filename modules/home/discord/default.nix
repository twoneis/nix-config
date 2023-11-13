{ ... }: {
  programs.discocss = {
    enable = true;
    css = import ./rosepine.css;
  };
}
