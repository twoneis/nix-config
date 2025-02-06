{ config, ... }: let
  inherit (config) conf;
in {
  imports = [
    ./apps
    ./containers
    ./fedi
    ./fonts
    ./games
    ./home
    ./layout
    ./networking
    ./nginx
    ./niri
    ./nix
    ./secureboot
    ./ssh
    ./utils
    ./vm
    ./website
  ];

  documentation.nixos.enable = false;

  time.timeZone = "Europe/Amsterdam";
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  users.users.${conf.username}= {
    isNormalUser = true;
    description = conf.username;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = conf.stateVersion;
}
