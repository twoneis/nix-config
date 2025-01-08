{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf mkForce;
  inherit (config) conf;
in {
  imports = [
    ./firefox.nix
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
      jack.enable = mkForce false;
    };

    # Run statically linked and more
    environment.systemPackages = with pkgs; [
      nix-alien
    ];

    programs.nix-ld.enable = true;

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

    # Regularly clean download folder
    systemd = {
      timers."clean-download" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "*-*-* 03:00:00";
          Unit = "clean-download.service";
        };
      };

      services."clean-download" = {
        script = ''
          ${pkgs.coreutils}/bin/rm -rf /home/${conf.username}/Downloads/*
        '';
        serviceConfig = {
          Type = "oneshot";
          User = "root";
        };
      };
    };

    services.blueman.enable = true;
  };
}
