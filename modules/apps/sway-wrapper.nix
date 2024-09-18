{ lib, pkgs, app, name, ... }: let 
  inherit (lib) concatStrings;
  config = pkgs.writeTextFile {
    name = concatStrings [ "i3-config" name ];
    text = ''
      exec ${app}
    '';
  };
in  pkgs.makeDesktopItem {
  name = name;
  desktopName = name;
  exec = "${pkgs.xwayland-run}/bin/xwayland-run -- ${pkgs.i3}/bin/i3 -c ${config}";
}
