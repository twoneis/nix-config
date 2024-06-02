{ config, lib, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "ums_realtek" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
      luks.devices.cryptroot.device = "/dev/disk/by-uuid/XXXX-XXXX";
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/4A39-D0DF";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-uuid/";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };
    "/nix" = {
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };
    "/persist" = {
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
    };
    "/swap" = {
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };
  };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
