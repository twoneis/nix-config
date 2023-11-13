{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    marksman
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = ./config.toml;
    themes = ./rosepine.toml;
  };
}
