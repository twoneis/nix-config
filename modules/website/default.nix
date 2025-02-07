{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.website.enable {
  services.nginx.virtualHosts = {
    "twoneis.site" = {
      serverName = "twoneis.site";
      useACMEHost = "twoneis.site";
      forceSSL = true;
      locations = {
        "/" = {
          return = "200 \"faggot\"";
        };
      };
    };
  };
}
