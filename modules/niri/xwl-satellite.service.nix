{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
in mkIf conf.niri.enable {
  environment.systemPackages = with pkgs; [ xwayland-satellite-unstable xwayland ];
  systemd.user.services.xwayland-satellite = {
    description = "Xwayland outside your Wayland";

    wantedBy = [ "graphical-session.target" ];
    bindsTo = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    requisite = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "notify";
      NotifyAccess = "all";
      ExecStart = "/${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      StandardOutput = "journal";

      Restart = "on-failure";
      RestartSec = "1s";
    };
  };
}
