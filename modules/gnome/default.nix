{ lib, config, pkgs, ... }: lib.mkIf config.withGnome {
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
  };

  services.gnome.core-utilities.enable = true;

  hardware.pulseaudio.enable = false;

  programs.dconf.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];
}
