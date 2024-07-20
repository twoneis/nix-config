{ lib, config, ... }: lib.mkIf config.withImpermanence {
  environment.persistence."/persist" = {
    enable = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/iwd"
    ];
    files = [
      "/etc/machine-id"
      "/etc/passwd"
      "/etc/shadow"
    ];

    users.${config.username}= {
      directories = [
        "Documents"
        "Pictures"
        "Videos"
        "Games"
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
