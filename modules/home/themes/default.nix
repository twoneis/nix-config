{ ... }: {
  qt = {
    enable = true;
    platformTheme = "gtk3";
    style.name = "adwaita-dark";
  };

  gtk = {
    enable = true;
    font.name = "Alegreya Sans";
    theme.name = "Adwaita Dark";
  };
}
