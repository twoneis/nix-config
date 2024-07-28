{ lib, config, pkgs, ... }: lib.mkIf config.full {
  home-manager.user.${config.username} = {
    home.packages = [
    ];

    programs.sioyek = {
      enable = true;
      bindings = {
        "move_up" = "k";
        "move_down" = "k";
        "move_left" = "k";
        "move_right" = "k";
      };
    };
  };
}
