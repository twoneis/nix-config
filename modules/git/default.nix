{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
  cfg = config.services.forgejo.settings.server;
in mkIf conf.git.enable {
  services = {
    nginx = {
      virtualHosts.${cfg.DOMAIN} = {
        forceSSL = true;
        useACMEHost = "twoneis.site";
        extraConfig = ''
          client_max_body_size 512M;
        '';
        locations."/".proxyPass = "http://localhost:${toString cfg.HTTP_PORT}";
      };
    };

    forgejo = {
      enable = true;
      database.type = "postgres";
      lfs.enable = true;
      settings = {
        server = {
          DOMAIN = "git.twoneis.site";
          ROOT_URL = "https://${cfg.DOMAIN}";
          HTTP_PORT = 3000;
        };
        service.DISABLE_REGISTRATION = true;
        actions = {
          ENABLED = true;
          DEFAULT_ACTIONS_URL = "github";
        };
      };
    };
  };
}
