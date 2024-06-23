{ pkgs, lib, config, ... }: lib.mkIf (config.withPlasma) {
  services = {
    displayManager.sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
      theme = "where_is_my_sddm_theme";
    };

    desktopManager.plasma6 = {
      enable = true;
    };
  };

  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      oxygen
    ];

    systemPackages = [ (pkgs.where-is-my-sddm-theme.override ({ themeConfig = builtins.readFile ./sddm-theme.conf; })) ];
  };

  programs.dconf.enable = true;
}
