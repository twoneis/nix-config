{ lib, config, pkgs, ... }: lib.mkIf config.withContainers {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = [ pkgs.distrobox ];
}
