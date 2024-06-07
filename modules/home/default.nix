{ config, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.twoneis = {
      imports = [
        ./utils
      ] ++ (if config.withNiri then [
        ./niri-setup
        ./themes
      ] else []) ++ (if config.withGnome then [
        ./themes
      ] else []) ++ (if config.full then [
        ./programs
      ] else []);

      home = {
        username = "twoneis";
        homeDirectory = "/home/twoneis";

        stateVersion = "24.11";
      };

      programs.home-manager.enable = true;
    };
  };
}
