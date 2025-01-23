{ conf, lib }: let
  inherit (lib) mkIf;
in mkIf conf.apps.enable {
  programs.adb.enable = true;
  users.users.${conf.username}.extraGroups = [ "adbusers" ];
}
