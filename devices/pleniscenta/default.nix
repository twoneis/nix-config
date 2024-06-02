{ ... }: {
  imports = [
    ./hardware-config.nix
    ./options.nix
  ];

  networking.hostName = "akarso";

  boot.loader = {
    systemd-boot = {
      enable = true;
    };
    efi.canTouchEfiVariables = true;
  };

  services.zfs.autoScrub.enable = true;
  services.zfs.trim.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.thermald.enable = true;

  system.stateVersion = "23.05";

}
