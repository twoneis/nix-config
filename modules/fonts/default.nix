{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      alegreya
      alegreya-sans
      nerd-fonts.fira-code
      roboto
      ubuntu_font_family
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Alegreya" ];
        sansSerif = [ "Alegreya Sans" ];
        monospace = [ "Fira Code Nerd Font" ];
      };
    };
  };
}
