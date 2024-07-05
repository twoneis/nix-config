{ ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.twoneis = {
      home = {
        username = "twoneis";
        homeDirectory = "/home/twoneis";
      };

      programs.home-manager.enable = true;
    };
  };
}
