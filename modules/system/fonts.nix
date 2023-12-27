{ pkgs, ... }: {
  # Configure fonts
  fonts.packages = with pkgs; [
    alegreya
    alegreya-sans
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "Alegreya" ];
      sansSerif = [ "Alegreya Sans" ];
      monospace = [ "Fira Code Nerd Font" ];
    };
  };
}
