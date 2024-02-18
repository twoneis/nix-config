{ lib, config, ... }: lib.mkIf (config.withNiri) {
  programs.niri.enable = true;
  home-manager.users.twoneis = {
    programs.niri = {
      config = builtins.readFile ./config.kdl;
    };
  };
}
