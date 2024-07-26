{ config, ... }: {
  mainBar = {
    layer = "top";
    position = "top";
    modules-left = [
      "backlight"
      "wireplumber"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "network"
      "battery"
    ];

    "backlight" = {
      format = "{icon}";
      format-alt = "{percent}%";
      format-icons = [ "" "" "" "" "" "" "" "" "" "" "" "" "" ];
      tooltip = false;
    };
    "wireplumber" = {
      format = "{icon}";
      format-alt = "{volume}%";
      format-muted = "";
      format-icons = ["" "" ""];
      tooltip = false;
    };

    "clock" = {
      format = "{:%H:%M}";
      format-alt = "{:%a, %Y-%m-%d}";
    };
  
    "network" = {
      format-wifi = "{icon}";
      format-alt = "{essid}";
      format-ethernet = "󰈁";
      format-disconnected = "󰤭";
      format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
      tooltip = false;
    };
    "battery" = {
      states = {
        good = 80;
        warning = 30;
        critical = 10;
      };
      format = "{icon}";
      format-alt = "{capacity}%";
      format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
      tooltip = false;
    };
  };
}
