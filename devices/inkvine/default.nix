{ config, pkgs, ... }: {
  imports = [
    ./options.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking = {
    hostName = "inkvine";
  };

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" "rtsx_pci_sdmmc" ];
      luks.devices.root.device = "/dev/disk/by-uuid/747ae319-f189-44f5-9737-a42672e2c02d";
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
      device = "/dev/disk/by-uuid/4672-C1A9";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-uuid/04255623-c061-4cf0-89fa-b3d8eb239d59";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/04255623-c061-4cf0-89fa-b3d8eb239d59";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };
    "/swap" = {
      device = "/dev/disk/by-uuid/04255623-c061-4cf0-89fa-b3d8eb239d59";
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

    nvidia =  {
      modesetting.enable = true;
      nvidiaSettings = false;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";

        sync.enable = true;
      };
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  system.stateVersion = "24.05";

}
