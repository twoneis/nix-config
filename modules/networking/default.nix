{ config, lib, pkgs, ... }: let
  inherit (config) conf;
  inherit (lib) mkIf;
in mkIf conf.networkmanager.enable {
  home-manager.users.${conf.username}.home.packages = [ pkgs.networkmanagerapplet ];
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    extraHosts = 
    ''
      10.10.11.245 surveillance.htb
    '';
  };
}
