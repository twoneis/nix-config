{ lib, ... }: let
  inherit (lib) mkDefault;
in {
  networking = {
    useDHCP = mkDefault true;
    wireless.iwd.enable = true;
    extraHosts = 
    ''
      10.10.11.245 surveillance.htb
    '';
  };
}
