{ lib, config, pkgs, ... }: let
  inherit (lib) mkDefault;
  inherit (config.device) disks;
in {
  imports = [
    ./disks.nix
    ./options.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "inkvine";

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
      luks.devices.root.device = "/dev/disk/by-uuid/${disks.crypt}";
      kernelModules = [ "amdgpu" ];
    };
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot = {
        enable = mkDefault true;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/${disks.boot}";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-uuid/${disks.root}";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/${disks.root}";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };
    "/vm" = {
      device = "/dev/disk/by-uuid/${disks.root}";
      fsType = "btrfs";
      options = [ "subvol=vm" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };
    "/persist" = {
      device = "/dev/disk/by-uuid/${disks.root}";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };
    "/swap" = {
      device = "/dev/disk/by-uuid/${disks.root}";
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };
  };
  swapDevices = [ { device = "/swap/swapfile"; } ];

  services = {
    fwupd.enable = true;
    power-profiles-daemon.enable = true;
    btrfs.autoScrub = {
      enable = true;
      fileSystems = [ "/" ];
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
