{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf mkForce;
in mkIf config.withSecureBoot {
  environment.systemPackages = [ pkgs.sbctl ];

  boot.loader.systemd-boot.enable = mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}
