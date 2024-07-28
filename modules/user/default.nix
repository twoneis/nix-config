{ lib, config, pkgs, ... }: {
  imports = [
    ./media.nix
    ./programs.nix
    ./themes.nix
  ];

  config = lib.mkIf config.full {
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

    home-manager.users.${config.username}.home.packages = [ pkgs.overskride ];

    services.blueman.enable = true;
  };
}
