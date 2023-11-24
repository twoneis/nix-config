{ pkgs, nix-doom-emacs, ... }: {
  home.packages = with pkgs; [
    nil
    marksman
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = import ./helix-config.nix;
    themes = import ./helix-theme.nix;
  };

  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d;
  };
}
