{ lib, config, ... }: lib.mkIf (config.withPlasma) {
  services.desktopManager.plasma6.enable = true;
}
