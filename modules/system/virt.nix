{ ... }: {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.twoneis.extraGroups = [ "libvirtd" ];
}
