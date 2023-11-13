{ ... }: {
  imports = [
    ./art
    ./browser
    ./chat
    ./discord
    ./editor
    ./email
    ./games
    ./gdb
    ./git
    ./media
    ./terminal
    ./utils
  ];

  home = {
    username = "twoneis";
    homeDirectory = "/home/twoneis";

    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;
}
