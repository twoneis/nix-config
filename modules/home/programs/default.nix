{ pkgs, osConfig, ... }: {
  imports = [
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    signal-desktop
    vesktop
    fractal
    loupe
    snapshot
    gnome.nautilus
    libreoffice-qt6-fresh
  ];

  programs.pandoc = {
    enable = true;
  };

  programs.mpv = {
    enable = true;
  };

  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        device_name = osConfig.networking.hostName;
        bitrate = 320;
        volume_normalisation = true;
        autoplay = false;
        zeroconf_port = 57621;
      };
    };
  };

  programs.thunderbird = {
    enable = true;
    profiles = {
      "default" = {
        isDefault = true;
      };
    };
  };

  programs.alacritty = {
    enable = true;
    settings = import ./alacritty-config.nix;
  };

}
