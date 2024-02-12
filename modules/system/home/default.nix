{ ... }: {
  imports = [
    ./art
    ./browser
    ./chat
    ./cursor
    ./discord
    ./direnv
    ./editor
    ./email
    ./gdb
    ./git
    ./media
    ./shell
    ./terminal
    ./themes
    ./utils
  ];

  home = {
    username = "twoneis";
    homeDirectory = "/home/twoneis";

    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
