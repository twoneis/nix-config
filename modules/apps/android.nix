{ config, lib, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.apps.enable {
  programs.adb.enable = true;
  users.users.${conf.username}.extraGroups = [ "adbusers" ];
}
