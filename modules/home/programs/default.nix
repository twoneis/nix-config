{ pkgs, osConfig, ... }: {
  home.packages = with pkgs; [
    krita
    loupe
    gnome.nautilus
  ];

  # Needed for some features in nautilus such as auto-mounting and trash
  osConfig.services.gvfs.enable = true;

  programs.pandoc = {
    enable = true;
  };

  programs.mpv = {
    enable = true;
  };

  osConfig.networking.firewall.allowedTCPPorts = [ 57621 ];
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
