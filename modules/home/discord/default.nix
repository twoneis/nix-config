{ pkgs, ... }: {
  home.packages = with pkgs; [
    dorion
    webcord
  ];

  home.file = {
    ".config/dorion/config.json" = {
      source = ./config.json;
    };
    ".config/dorion/themes/rose-pine.css" = {
      source = ./rose-pine.css;
    };
  };
}
