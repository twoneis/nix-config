{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "twoneis";
    userEmail = "sanjay29@sapura.de";
  };

  home.packages = with pkgs; [ gh ];
}
