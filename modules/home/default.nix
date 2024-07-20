{ config, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${config.username} = {
      home = {
        username = "twoneis";
        homeDirectory = "/home/${config.username}";

        stateVersion = config.hmStateVersion;
      };

      programs.home-manager.enable = true;
    };
  };
}
