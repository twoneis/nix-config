{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.fedi.enable {
  services.akkoma = {
    enable = true;
    nginx = {
      serverName = "fedi.twoneis.site";
    };
  };
}
