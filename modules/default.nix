{ config, pkgs, ... }: let
  inherit (config) conf;
in {
  imports = [
    ./apps
    ./containers
    ./fonts
    ./games
    ./home
    ./impermanence
    ./layout
    ./networking
    ./niri
    ./nix
    ./secureboot
    ./utils
    ./vm
  ];

  documentation.nixos.enable = false;

  time.timeZone = "Europe/Amsterdam";
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      excludePackages = [ pkgs.xterm ];
    };
  };

  users.users.${conf.username}= {
    isNormalUser = true;
    description = conf.username;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  hardware.opentabletdriver = {
    enable = true;
  };

  system.stateVersion = conf.stateVersion;
}
