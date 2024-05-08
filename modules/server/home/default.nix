{ ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.twoneis = {
      imports = [
        ../../system/home/direnv
        ../../system/home/editor
        ../../system/home/git
        ../../system/home/shell
        ./server-utils
      ];

      home = {
        username = "twoneis";
        homeDirectory = "/home/twoneis";

        stateVersion = "22.11";
      };

      programs.home-manager.enable = true;
    };
  };
}
