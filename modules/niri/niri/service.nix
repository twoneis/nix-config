{ ... }: {
  systemd.services.niri = {
    enable = true;
    description = "A scrollable-tiling wayland compositor";

    bindsTo = [ "graphical-session.target" ];
    before = [ "graphical-session.target" "xdg-desktop-autostart.target" ];
    after = [ "graphical-session-pre.target" ];
    wants = [ "graphical-session-pre.target" "xdg-desktop-autostart.target" ];

    serviceConfig = {
      Type = "notify";
      ExecStart = "/usr/bin/env niri";
    };
  };
}
