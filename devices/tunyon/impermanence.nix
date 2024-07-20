{ config, ... }: {
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
        "code"
        { directory = ".local/share/keyrings"; mode = "0700"; }
        ".local/share/direnv"
      ];
    };
  };
}
