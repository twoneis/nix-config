{ pkgs, lib, config, ... }: lib.mkIf(config.withContainers) {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = [ pkgs.distrobox ];
}
