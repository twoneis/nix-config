{ pkgs, ... }: {
  imports = [
    ./options.nix
    ./disko.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "ellaca";

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
      kernelModules = [ "amdgpu" ];
    };
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
