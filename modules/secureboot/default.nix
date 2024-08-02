{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf mkForce;
  inherit (config) conf;
in mkIf conf.secureboot.enable {
  environment.systemPackages = [ pkgs.sbctl ];

  boot.loader.systemd-boot.enable = mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}
