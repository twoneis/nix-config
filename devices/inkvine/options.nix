{ ... }: {
  conf = {
    apps.enable = true;
    niri.enable = true;
    games.enable = true;
    secureboot.enable = true;
    extraLayout.enable = true;
    containers.enable = true;

    stateVersion = "24.05";
    hmStateVersion = "24.11";
  };
}
