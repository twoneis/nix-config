{ pkgs, lib, config, ... }: lib.mkIf (config.withGnome) {
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # Don't pull unnecessary packages
  services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages = [ pkgs.gnome-tour ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.paperwm
    gnome.gnome-characters
  ];
}
