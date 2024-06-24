{ pkgs, lib, config, ... }: lib.mkIf (config.withGnome) {
  services.xserver = {
    desktopManager.gnome.enable = true;
  };

  services.gnome.core-utilities.enable = true;

  hardware.pulseaudio.enable = false;

  programs.dconf.enable = true;
}
