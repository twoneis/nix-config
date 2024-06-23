{ config, pkgs, ... }: {
  imports = [
    ./options.nix
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
    "/ext" = {
      device = "/dev/disk/by-uuid/3ed92a26-775a-4e39-ac1c-84b2822cd3dd";
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
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  system.stateVersion = "23.05";
}
