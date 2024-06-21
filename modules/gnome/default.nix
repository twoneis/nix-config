{ pkgs, lib, config, ... }: lib.mkIf (config.withGnome) {
  services.xserver.displayManager.sessionPackages = [ pkgs.gnome.gnome-session.sessions ];
  environment.systemPackages = [ pkgs.gnome.gnome-shell pkgs.gnome-randr ];
}
