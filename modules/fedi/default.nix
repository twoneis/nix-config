{ lib, pkgs, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.fedi.enable {
  services = {
    akkoma = {
      enable = true;
      user = "akkoma";
      config = {
        ":pleroma" = {
          ":instance" = {
            name = "mira on fedi";
            description = "miras fedi instance";
            email = "mira.cp.0909@gmail.com";
            registration_open = true;
          };

          "Pleroma.Web.Endpoint" = {
            url.host = "fedi.twoneis.site";
          };
        };
      };
      nginx = {
        serverName = "fedi.twoneis.site";
        useACMEHost = "twoneis.site";
        forceSSL = true;
      };
    };
  };
}
