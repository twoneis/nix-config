{ pkgs, lib, config, ... }: lib.mkIf (config.withPlasma) {
  services = {
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
  };

  programs.dconf.enable = true;
}
