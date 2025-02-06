{ lib, pkgs, ... }: let
  inherit (lib) mkDefault;
in {
  imports = [
    ./options.nix
    ./disko.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "ellaca";

  boot = {
    initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" ];
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      grub = {
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
    };
  };

}
