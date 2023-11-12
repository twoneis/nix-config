{ pkgs, ... }: {
  home.packages = with pkgs; [
    nil
    marksman
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = import ./helix-config.nix;
    themes = ./helix-theme.nix;
  };
}
