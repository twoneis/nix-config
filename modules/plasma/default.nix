{ lib, config, pkgs, ... }: lib.mkIf (config.withPlasma) {
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs; [
    plasma-browser-integration
    konsole
    ark
    elisa
    gwenview
    okular
    kate
    khelpcenter
    print-manager
    dolphin
    dolphin-plugins
    spectacle
    ffmpegthumbs
  ];
}
