{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.ssh.enable {
  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB5i6DgsV5wbkkEJzFbN624Sz0CKg9LGplfJUjeCpAdE"
  ];

  users.users.${conf.username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB5i6DgsV5wbkkEJzFbN624Sz0CKg9LGplfJUjeCpAdE"
  ];
}
