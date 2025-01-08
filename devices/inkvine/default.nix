{ lib, config, pkgs, ... }: let
  inherit (lib) mkDefault;
  inherit (config.device) disks;
in {
  imports = [
    ./disko.nix
    ./options.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "inkvine";

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
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

  services = {
    fwupd.enable = true; 
    power-profiles-daemon.enable = true;
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
