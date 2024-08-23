{ ... }: {
  mainBar = {
    layer = "top";
    position = "top";
    modules-left = [
      "network"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "battery"
    ];

    "clock" = {
      format = "{:%H:%M}";
      format-alt = "{:%a, %Y-%m-%d}";
      tooltip = false;
    };
  
    "network" = {
      format-wifi = "{icon}";
      format-alt = "{essid}";
      format-ethernet = "󰈁";
      format-disconnected = "󰤭 ";
      format-icons = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
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
