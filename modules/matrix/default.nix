{ config, lib, ... }: let
  inherit (config) conf;
  inherit (lib) mkIf;
in mkIf conf.matrix.enable {
  services.nginx.virtualHosts = {
    "matrix.twoneis.site" = {
      serverName = "matrix.twoneis.site";
      forceSSL = true;
      useACMEHost = "twoneis.site";
      locations = {
        "/" = {
          recommendedProxySettings = true;
          proxyPass = "http://127.0.0.1:6167";
        };
      };
    };
  };

  services.conduwuit = {
    enable = true;
    settings.global = {
      server_name = "matrix.twoneis.site";
      allow_registration = true;
    };
  };
}
