{ pkgs, ... }: {
  home.packages = with pkgs; [
    webcord
    # dorion
  ];

  # home.file = {
  #   ".config/dorion/config.json" = {
  #     source = ./dorion-config.json;
  #   };
  #   ".config/dorion/themes/rose-pine.theme.css" = {
  #     source = ./rose-pine.theme.css;
  #   };
  # };
}
