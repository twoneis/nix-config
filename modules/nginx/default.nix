{ config, lib, ... }: let
  inherit (config) conf;
  inherit (lib) mkIf;
in mkIf conf.nginx.enable {
  security.acme = {
    acceptTerms = true;
    defaults.email = "mira.cp.0909@gmail.com";
    certs = {
      "twoneis.site" = {
        group = "nginx";
        domain = "twoneis.site";
        extraDomainNames = [ "*.twoneis.site" ];
        dnsProvider = "porkbun";
        email = "mira.cp.0909@gmail.com";
        environmentFile = "/root/porkbun-creds";
      };

      "chpu.eu" = {
        group = "nginx";
        domain = "chpu.eu";
        dnsProvider = "porkbun";
        email = "mira.cp.0909@gmail.com";
        environmentFile = "/root/porkbun-creds";
      };
    };
  };

  users.users.nginx.extraGroups = [ "acme" ];

  services.nginx = {
    enable = true;
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
