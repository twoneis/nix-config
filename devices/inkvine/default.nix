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
      verbose = false;
    };
    kernelModules = [ "kvm-amd" ];
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=fail"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    loader = {
      systemd-boot = {
        enable = mkDefault true;
        editor = false;
      };
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      theme = "motion";
      themePackages = [(pkgs.adi1090x-plymouth-themes.override {
        selected_themes = [ "motion" ];
      })];
    };
    consoleLogLevel = 0;
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
