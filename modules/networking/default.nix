{ config, pkgs, ... }: {
  home-manager.users.${config.username}.home.packages = [ pkgs.networkmanagerapplet ];
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
