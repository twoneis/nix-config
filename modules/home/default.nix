{ config, ... }: let
  imp = if config.minimal then [
    ./utils
  ] else [
    ./browser
    ./communication
    ./niri-setup
    ./programs
    ./themes
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

        stateVersion = "24.11";
      };

      programs.home-manager.enable = true;
    };
  };
}
