{ pkgs, ... }: {
  home.packages = with pkgs; [
    man-pages
    man-pages-posix
    gnome.nautilus
    baobab
    tree
    zip
    unzip
    blueberry
  ];

  programs.man = {
    enable = true;
  };

  programs.bottom = {
    enable = true;
  };

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "transgender";
      mode = "rgb";
      light_dark = "dark";
      lightness = 0.65;
      color_align = {
          mode = "horizontal";
          custom_colors = [];
          fore_back = null;
      };
      backend = "neofetch";
      args = null;
      distro = "nixos_old";
      pride_month_shown = [];
      pride_month_disable = false;
    };
  };
}
