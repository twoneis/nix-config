{ lib, config, ... }: lib.mkIf config.full {
  home-manager.users.${config.username} = {
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
