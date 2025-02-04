{ config, ... }: let
  inherit (config) conf;
in {
  imports = [
    ./ssh
  ];

  system.stateVersion = conf.stateVersion;
}
