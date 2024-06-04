{ config, lib, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "ums_realtek" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
      luks.devices."root".device = "/dev/disk/by-uuid/470a6d23-9f08-4c4d-afbb-63d6df1ab6a6";
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/4A39-D0DF";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-uuid/75e6536a-4836-4f50-86b3-f9250edca3c0";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/75e6536a-4836-4f50-86b3-f9250edca3c0";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };
    "/persist" = {
      device = "/dev/disk/by-uuid/75e6536a-4836-4f50-86b3-f9250edca3c0";      
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
    }; 
    "/swap" = {
      device = "/dev/disk/by-uuid/75e6536a-4836-4f50-86b3-f9250edca3c0";
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };
  };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
