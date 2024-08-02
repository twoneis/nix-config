{ config, ... }: let
  inherit (config) conf;
in{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${conf.username} = {
      home = {
        username = "twoneis";
        homeDirectory = "/home/${conf.username}";

        stateVersion = conf.hmStateVersion;
      };

      programs.home-manager.enable = true;
    };
  };
}
