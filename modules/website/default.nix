{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.website.enable {
  services.nginx.virtualHosts = {
    "twoneis.site" = {
      servername = "twoneis.site";
      forceSSL = false;
      locations = {
        "/" = {
          return = "200 \"Faggot\"";
        };
      };
    };
  };
}
