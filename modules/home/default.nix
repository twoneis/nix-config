{ inputs, config, lib, ... }: let
  modules = lib.lists.flatten [
    (if config.withNiri then [
      ./niri-setup
      ./themes
    ] else [])
    (if config.withGnome then [
      ./themes
    ] else [])
    (if config.withPlasma then [
      ./plasma
      ./themes
    ] else [])
    (if config.full then [
      ./programs
    ] else [])
  ];
in {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

    users.twoneis = {
      imports = [
        ./utils
      ] ++ modules;

      home = {
        username = "twoneis";
        homeDirectory = "/home/twoneis";

        stateVersion = "24.11";
      };

      programs.home-manager.enable = true;
    };
  };
}
