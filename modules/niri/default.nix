{ niri, ... }: {
  services.xserver.displayManager.sessionPackages = [
    niri
  ];
}
