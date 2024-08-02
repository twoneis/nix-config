{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.apps.enable {
  home-manager.users.${conf.username} = {
    home.packages = [
    ];

    programs.sioyek = {
      enable = true;
      bindings = {
        "move_up" = config.keys.up;
        "move_down" = config.keys.down;
        "move_left" = config.keys.left;
        "move_right" = config.keys.right;
      };
    };
  };
}
