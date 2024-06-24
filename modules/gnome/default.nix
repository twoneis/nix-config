{ pkgs, lib, config, ... }: lib.mkIf (config.withGnome) {
  services.xserver = {
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs.gnome; [
    nixos-background-info
    gnome-shell-extensions
    pkgs.gnome-tour # GNOME Shell detects the .desktop file on first log-in.
    pkgs.gnome-user-docs
    pkgs.orca
    pkgs.gnome-menus
  ]);

  programs.dconf.enable = true;
}
