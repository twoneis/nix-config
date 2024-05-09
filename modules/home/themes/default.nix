{ pkgs, ... }: {
  home.packages = with pkgs; [
    dconf
  ];

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.package = pkgs.adwaita-qt;
    style.name = "adwaita-dark";
  };

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk2.extraConfig = "gtk-application-prefer-dark-theme=1\n";
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    theme.name = "Adwaita Dark";
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  home.pointerCursor = let getFrom = url: hash: name: {
    gtk.enable = true;
    x11.enable = true;
    name = name;
    size = 24;
    package = pkgs.runCommand "moveUp" {} ''
      mkdir -p $out/share/icons
      ln -s ${pkgs.fetchzip{
        url = url;
        hash = hash;
      }} $out/share/icons/${name}
    '';
  }; in getFrom "https://github.com/rose-pine/cursor/releases/download/v1.1.0/BreezeX-RosePine-Linux.tar.xz" "sha256-t5xwAPGhuQUfGThedLsmtZEEp1Ljjo3Udhd5Ql3O67c=" "BreezX-RosePine-Linux";
}
