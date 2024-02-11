{ pkgs, ... }: {
  imports = [
    ./hardware-config.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "zotac-mini";

  boot.loader = {
    systemd-boot = {
      enable = true;
    };
  };

  system.stateVersion = "24.05";
}
