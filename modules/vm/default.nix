{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.vm.enable {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.${conf.username}.extraGroups = [ "libvirtd" ];
  home-manager.users.${conf.username} = {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
