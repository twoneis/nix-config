{ config, pkgs, ... }: {
  imports = [
    ./options.nix
    ./disks.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "ellaca";

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
    };

    kernelModules = [ "kvm-amd" ];
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        font = null;
        splashImage = null;
      };
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
    "/ext" = {
      device = "/dev/disk/by-uuid/${config.disks.ext}";
      fsType = "btrfs";
      options = [ "subvol=ext" "compress=zstd" "noatime" ];
    };
  };

  services = {
    xserver.videoDrivers = ["nvidia"];
  };

  hardware = {
    enableRedistributableFirmware = true;
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;


    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = false;
      package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
