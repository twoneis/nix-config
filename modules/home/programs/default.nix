{ pkgs, osConfig, ... }: {
  home.packages = with pkgs; [
    krita
    loupe
    gnome.nautilus
    anki-bin
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

  programs.alacritty = {
    enable = true;
    settings = import ./alacritty-config.nix;
  };

}
