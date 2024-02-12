{ ... }: {
  qt = {
    enable = true;
    platformTheme = "gtk3";
    style.name = "adwaita-dark";
  };

  gtk = {
    enable = true;
    theme.name = "Adwaita Dark";
  };
}
