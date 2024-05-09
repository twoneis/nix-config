{ lib, config, pkgs, ... }: lib.mkIf (config.withDistrobox) {
  environment.systemPackages = with pkgs; [
    distrobox
  ];
}
