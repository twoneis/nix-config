{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.impermanence.enable {
  environment.persistence."/persist" = {
    enable = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/iwd"
      "/etc/secureboot"
    ];
    files = [
      "/etc/machine-id"
      "/etc/passwd"
      "/etc/shadow"
    ];

    users.${conf.username}= {
      directories = [
        "Documents"
        "Pictures"
        "Videos"
        "code"
        { directory = ".local/share/keyrings"; mode = "0700"; }
        ".local/share/direnv"
      ];
    };
  };

  boot.initrd = {
    enable = true;
    supportedFilesystems = [ "btrfs" ];

    systemd.services.restore-boot = {
      description = "Rollback btrfs rootfs";
      WantedBy = [ "initrd.target" ];
      requires = [
        
      ];
    };
  };
}
