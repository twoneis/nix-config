{ pkgs, ... }: {
  home.packages = with pkgs; [
    image-roll
  ];

  programs.mpv = {
    enable = true;
  };

  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        device_name = "desktop";
        bitrate = 160;
        volume_normalisation = true;
        autoplay = false;
        zeroconf_port = 57621;
      };
    };
  };
}
