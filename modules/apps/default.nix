{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in {
  imports = [
    ./media.nix
    ./notes.nix
    ./programs.nix
    ./themes.nix
  ];

  config = mkIf conf.apps.enable {
    # Audio
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # Bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };

    home-manager.users.${conf.username}.home.packages = [ pkgs.overskride ];

    services.blueman.enable = true;
  };
}
