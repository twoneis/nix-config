{ config, lib, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/4ecc3b27-016f-4416-a819-bd0998fc993f";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/0721-3632";
      fsType = "vfat";
    };
    "/ext" = {
      device = "/dev/disk/by-uuid/b3faf000-8792-4fca-916a-5965c0cb8186";
      fsType = "ext4";
    };
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/b35abec3-ff20-4b3b-b953-e36f2df719cb"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
