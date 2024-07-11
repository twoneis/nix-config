{ config, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.twoneis = {
      home = {
        username = "twoneis";
        homeDirectory = "/home/twoneis";

        stateVersion = config.hmStateVersion;
      };

      programs.home-manager.enable = true;
    };
  };
}
