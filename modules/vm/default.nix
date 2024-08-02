{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.vm.enable {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.${conf.username}.extraGroups = [ "libvirtd" ];
}
