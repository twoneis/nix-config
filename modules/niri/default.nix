{ pkgs, ... }: 
let
  niri = pkgs.callPackage ./niri {};
  niriSession = pkgs.writeShellScriptBin "niri-session" ./niri/niri-session;
  niriService = ./niri/service.nix;
in {
  imports = [
    niriService
  ];

  environment.systemPackages = [ niri niriSession];
  services.xserver.displayManager.sessionPackages = [
    niriSession
  ];
}
