{ pkgs, config, ... }: {
  imports = [
    ./options.nix
    ./disks.nix
  ];

  nixpkgs = {
    hostPlatform = "x86_64-linux";
  };

  networking = {
    hostName = "inkvine";
  };

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" "rtsx_pci_sdmmc" ];
      luks.devices.root.device = "/dev/disk/by-uuid/${config.disks.crypt}";
    };

    kernelModules = [ "kvm-intel" ];
    kernelPackages = pkgs.linuxPackages_zen;

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
    "/swap" = {
      device = "/dev/disk/by-uuid/${config.disks.root}";
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };
  };
  swapDevices = [ { device = "/swap/swapfile"; } ];

  services = {
    thermald.enable = true;
    upower.enable = true;
  };

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
