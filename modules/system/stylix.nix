{ pkgs, ... }: {
  stylix = {
    image = ../../wallpaper/wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    fonts = {
      serif = {
        package = pkgs.alegreya;
        name = "Alegreya";
      };
      sansSerif = {
        package = pkgs.alegreya;
        name = "Alegreya Sans";
      };
      monospace = {
        package = pkgs.fira-code;
        name = "Fira Code";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    cursor = {
      size = 24;
    };
  };
}
