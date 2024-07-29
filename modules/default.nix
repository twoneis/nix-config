{ lib, config, ... }: {
  imports = [
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
    ./user
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
    };
  };

  users.users.${config.username}= {
    isNormalUser = true;
    description = config.username;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = config.stateVersion;
}
