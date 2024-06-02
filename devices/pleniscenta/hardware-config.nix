{ config, lib, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "ums_realtek" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    supportedFilesystems = [ "zfs" ];
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/4A39-D0DF";
      fsType = "vfat";
    };
    "/" = {
      device = "zpool/root";
      fsType = "zfs";
    };
    "/nix" = {
      device = "zpool/nix";
      fsType = "zfs";
    };
    "/persist" = {
      device = "zpool/persist";
      fsType = "zfs";
    };
  };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
