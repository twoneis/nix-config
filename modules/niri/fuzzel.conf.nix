{ lib, config, ... }: {
  colors = with lib; with strings; {
    background = concatStrings [ config.theme.base "ee" ];
    text = concatStrings [ config.theme.text "ff" ];
    match = concatStrings [ config.theme.gold "ff" ];
    selection = concatStrings [ config.theme.highlight-med "ee" ];
    selection-text = concatStrings [ config.theme.text "ff" ];
    selection-match = concatStrings [ config.theme.gold "ff" ];
    border = concatStrings [ config.theme.overlay "ff" ];
  }; 
}
