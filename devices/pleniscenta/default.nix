{ config, pkgs, ... }: {
  imports = [
    ./options.nix
    ./disks.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "pleniscenta";

  boot = {
    initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "ums_realtek" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
      luks.devices."root".device = "/dev/disk/by-uuid/${config.disks.crypt}";
    };

    kernelModules = [ "kvm-intel" ];
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/${config.disks.boot}";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-uuid/${config.disks.root}";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/${config.disks.root}";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };
    "/persist" = {
      device = "/dev/disk/by-uuid/${config.disks.root}";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
    }; 
    "/swap" = {
      device = "/dev/disk/by-uuid/${config.disk.root}";
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };
  };
  swapDevices = [ { device = "/swap/swapfile"; } ];

  services.thermald.enable = true;

  hardware = {
    enableRedistributableFirmware = true;
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
