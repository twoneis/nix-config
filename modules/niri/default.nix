{ pkgs, ... }: 
{
  services.xserver.displayManager.sessionPackages = [
    ((pkgs.callPackage ./niri {}).overrideAttrs (prevAttrs: rec {
      postInstall =
      let
        niriSession = ''
          [Desktop Entry]
          Name=niri
          Comment=Scrolling wayland compositor
          Exec=niri
          Type=Application
          '';
      in ''
          mkdir -p $out/share/wayland-sessions
          echo "${niriSession}" > $out/share/wayland-sessions/niri.desktop
        '';
      passthru.providedSessions = [ "niri" ];
    }))
  ];
}
