{ pkgs, ... }: {
  home.packages = with pkgs; [
    logseq
  ];

  programs.pandoc = {
    enable = true;
  };
}
