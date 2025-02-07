{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
  name = "mira on fedi";
  description = "miras akkoma instance";
  email = "akkoma@chpu.eu";
in mkIf conf.fedi.enable {
  services.akkoma = {
    enable = true;
    config = {
      ":pleroma" = {
        ":instance" = {
          name = name;
          email = email;
          description = description;
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
