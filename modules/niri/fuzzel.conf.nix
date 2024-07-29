{ lib, config, ... }: let
  inherit (lib.strings) concatStrings;
  inherit (config) theme;
in {
  main = {
    font = "FiraCodeNerdFont:size=18";
    prompt = "";
    icons-enabled = false;
    terminal = "alacritty -e";
    list-executables-in-path = true;
  };
  colors = {
    background = concatStrings [ theme.base "ee" ];
    text = concatStrings [ theme.text "ff" ];
    match = concatStrings [ theme.gold "ff" ];
    selection = concatStrings [ theme.highlight-med "ee" ];
    selection-text = concatStrings [ theme.text "ff" ];
    selection-match = concatStrings [ theme.gold "ff" ];
  }; 
  border = {
    width = 0;
    radius = 8;
  };
}
