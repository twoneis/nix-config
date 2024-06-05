{ pkgs, lib, config, ... }: lib.mkIf (config.withGnome) {
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages = [ pkgs.gnome-tour ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.paperwm
    gnome.gnome-characters
  ];
}
