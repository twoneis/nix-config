{ config, ... }: let
  imp = if config.minimal then [
    ./browser
    ./communication
    ./niri-setup
    ./programs
    ./themes
    ./utils
  ] else [
    ./utils
  ];
in {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.twoneis = {
      imports = imp;

      home = {
        username = "twoneis";
        homeDirectory = "/home/twoneis";

        stateVersion = "22.11";
      };

      programs.home-manager.enable = true;
    };
  };
}
