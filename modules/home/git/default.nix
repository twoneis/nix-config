{ pkgs, ... }: {
  home.packages = [ pkgs.gh ];

  programs.git = {
    enable = true;
    userName = "twoneis";
    userEmail = "sanjay29@sapura.de";
  };
}
