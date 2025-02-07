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
        extraDomainNames = [ "*.twoneis.site" ];
        dnsProvider = "porkbun";
        email = "mira.cp.0909@gmail.com";
        environmentFile = "/root/porkbun-creds";
      };
    };
  };

  users.users.nginx.extraGroups = [ "acme" ];

  services.nginx = {
    enable = true;
    virtualHosts = {
      default = {
        serverName = ".twoneis.site";
        default = true;
        rejectSSL = true;
        locations."/" = {
          return = "404";
        };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
