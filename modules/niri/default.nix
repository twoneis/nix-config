{ niri, ... }: {
  services.xserver.displayManager.sessionPackages = [ niri.niri ];
}
