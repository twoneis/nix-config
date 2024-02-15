{ pkgs, ... }: {
  home.packages = with pkgs; [
    obsidian
  ];

  programs.pandoc = {
    enable = true;
  };
}
