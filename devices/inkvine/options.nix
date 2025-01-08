{ ... }: {
  conf = {
    apps.enable = false;
    niri.enable = false;
    extraLayout.enable = true;
    secureboot.enable = false;
    containers.enable = false;

    stateVersion = "24.11";
    hmStateVersion = "24.11";
  };
}
