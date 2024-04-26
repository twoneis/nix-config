{ pkgs, ... }: {
  imports = [
    ./hardware-config.nix
    ./options.nix
  ];

  networking.hostName = "akarso";

  # Add user to surface control group for surface linux
  users.users.twoneis.extraGroups = [ "surface-control" ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
    };
  };

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  services.thermald.enable = true;

  microsoft-surface = {
    ipts.enable = true;
    surface-control.enable = true;
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
