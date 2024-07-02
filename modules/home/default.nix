{ ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.twoneis = {
      imports = [
        ./utils
        ./programs
        ./themes
      ];

      home = {
        username = "twoneis";
        homeDirectory = "/home/twoneis";

        stateVersion = "24.11";
      };

      programs.home-manager.enable = true;
    };
  };
}
