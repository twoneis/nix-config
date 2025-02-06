{ ... }: {
  conf = {
    apps.enable = true;
    niri.enable = true;
    extraLayout.enable = true;
    fonts.enable = true;
    secureboot.enable = true;
    containers.enable = true;
    networkmanager.enable = true;

    stateVersion = "24.11";
    hmStateVersion = "24.11";
  };
}
