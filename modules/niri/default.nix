{ inputs, ... }: {
  environment.systemPackages = [ inputs.niri.packages.x86_64-linux.niri ];
  /*
  services.xserver.displayManager.sessionPackages = [
    niri
  ];
  */
}
