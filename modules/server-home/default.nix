{ ... }: {
  imports = [
    ../home/direnv
    ../home/editor
    ../home/git
    ../home/shell
    ./server-utils
  ];

  home = {
    username = "twoneis";
    homeDirectory = "/home/twoneis";

    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;
}
