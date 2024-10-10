{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.containers.enable {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
