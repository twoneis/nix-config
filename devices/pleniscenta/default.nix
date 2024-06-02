{ pkgs, ... }: {
  imports = [
    ./hardware-config.nix
    ./options.nix
  ];

  networking.hostName = "pleniscenta";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = {
    systemd-boot = {
      enable = true;
    };
    efi.canTouchEfiVariables = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.thermald.enable = true;

  system.stateVersion = "24.05";

}
