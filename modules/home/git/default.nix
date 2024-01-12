{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "twoneis";
    userEmail = "sanjay29@sapura.de";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };

  home.packages = with pkgs; [ gh ];
}
