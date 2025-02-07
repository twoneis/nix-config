{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.website.enable {
  services.nginx.virtualHosts = {
    "twoneis.site" = {
      serverName = "twoneis.site";
      forceSSL = false;
      locations = {
        "/" = {
          return = "200 \"faggot\"";
        };
      };
    };
    "fedi.twoneis.site" = {
      serverName = "fedi.twoneis.site";
      forceSSL = false;
      locations = {
        "/" = {
          return = "200 \"faggot on fedi?\"";
        };
      };
    };
    "git.twoneis.site" = {
      serverName = "git.twoneis.site";
      forceSSL = false;
      locations = {
        "/" = {
          return = "200 \"faggot on git?\"";
        };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [
    80
  ];
}
