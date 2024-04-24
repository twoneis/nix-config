{ pkgs, ... }: {
  home.packages = with pkgs; [
    image-roll
  ];

  programs.mpv = {
    enable = true;
  };

  services.spotifyd = {
    enable = true;
    package = (pkgs.spotifyd.override {withKeyring = true; });
    settings = {
      global = {
        device_name = "desktop";
        bitrate = 160;
        volume_normalisation = true;
        autoplay = false;
      };
    };
  };
}
