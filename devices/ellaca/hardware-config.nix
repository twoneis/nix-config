{ config, lib, ... }: {
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/646D-4793";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-uuid/1a5777297-4ed3-48d7-adc7-a937fa93d868";
      fsType = "btrfs";
      options = [ "subvol=rootfs" "compress=zstd" "noatime" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/1a5777297-4ed3-48d7-adc7-a937fa93d868";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };
    "/persist" = {
      device = "/dev/disk/by-uuid/1a5777297-4ed3-48d7-adc7-a937fa93d868";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
    };
    "/ext" = {
      device = "/dev/disk/by-uuid/89112638-6953-48a7-9b2f-dd61ce9fe8b0";
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
