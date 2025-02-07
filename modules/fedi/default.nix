{ lib, pkgs, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.fedi.enable {
  services.postgresql.enable = true;
  services.akkoma = {
    enable = true;
    initDb = {
      enable = false;
      password._secret = "/root/db_password";
      username = "root";
    };
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
        "Pleroma.Repo" = {
          username = "akkoma";
          password._secret = "/root/db_password";
          database = "akkoma";
          socket_dir = "/run/postgersql";
          adapter = (pkgs.formats.elixirConf { }).lib.mkRaw "Ecto.Adapters.Postgres";
        };
      };
    };
    nginx = {
      serverName = "fedi.twoneis.site";
    };
  };
}
