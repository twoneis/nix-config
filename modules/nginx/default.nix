{ config, lib, ... }: let
  inherit (config) conf;
  inherit (lib) mkIf;
in mkIf conf.nginx.enable {
  services.nginx = {
    enable = true;
    "*.twoneis.site" = {
      serverName = ".twoneis.site";
      forceSSL = false;
      locations = {
        "/" = {
          return = "200 \"nonexistent faggot\"";
        };
      };
    };
  };
}
