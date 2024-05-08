{ config, lib, ... }: {
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/7ABC-9C12";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-uuid/b6e6bca7-1435-4b41-b174-8550eace7c32";
      fsType = "btrfs";
      options = [ "subvol=rootfs" "compress=zstd" "noatime" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/b6e6bca7-1435-4b41-b174-8550eace7c32";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };
    "/persist" = {
      device = "/dev/disk/by-uuid/b6e6bca7-1435-4b41-b174-8550eace7c32";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
    };
    "/ext" = {
      device = "/dev/disk/by-uuid/3ed92a26-775a-4e39-ac1c-84b2822cd3dd";
      fsType = "btrfs";
      options = [ "subvol=ext" "compress=zstd" "noatime" ];
    };
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp6s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
