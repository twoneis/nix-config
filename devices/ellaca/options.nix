{ ... }: {
  conf = {
    apps.enable = true;
    niri.enable = true;
    containers.enable = true;

    stateVersion = "24.05";
    hmStateVersion = "24.11";
  };
}
