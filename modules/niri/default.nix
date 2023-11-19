{ inputs, ... }:
let
  niri = inputs.niri.packages.x86_64-linux.default;
in{
  environment.systemPackages = [ niri ];
  services.xserver.displayManager.sessionPackages = [
    niri
  ];
}
