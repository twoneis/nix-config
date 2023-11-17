{ pkgs, ... }: {
  environment.systemPackages = [
    (pkgs.callPackage ./niri {})
  ];
}
