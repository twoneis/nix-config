{ pkgs, ... }: {
  imports = [
    ./hardware-config.nix
    ./disko.nix
    ./nvidia.nix
    ./options.nix
  ];

  networking.hostName = "ellaca";

  # Select kernel version
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Bootloader.
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true;
      # device = "nodev";
      useOSProber = true;
      font = null;
      splashImage = null;
    };
  };

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
