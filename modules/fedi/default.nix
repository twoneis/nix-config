{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.fedi.enable {
  services.akkoma = {
    enable = true;
    config = {
      ":pleroma" = {
        ":instance" = {
          name = "mira on fedi";
          email = "akkoma@chpu.eu";
          description = "miras fedi instance";
          registration_opn = false;
        };
        "Pleroma.Upload" = {
          base_url = "https://media.fedi.twoneis.site/media";
        };
      };
    };
    nginx = {
      serverName = "fedi.twoneis.site";
    };
  };
}
