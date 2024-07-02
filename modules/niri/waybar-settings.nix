{ config, ... }: {
  mainBar = {
    layer = "top";
    position = "top";
    modules-left = [
      "memory"
      "cpu"
      "temperature"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "network"
      "wireplumber"
      "battery"
    ];
    "cpu" = {
      interval = 10;
      format = "{usage}%";
    };
    "temperature" = {
      hwmon-path = config.hwmonPath;
      format = "{temperatureC}°C ";
      interval = 10;
      tooltip = false;
    };
    "memory" = {
      interval = 30;
      format = "{percentage}% ";
    };
    "clock" = {
      format = "{:%H:%M}";
      format-alt = "{:%a, %Y-%m-%d}";
    };
    "battery" = {
      states = {
        good = 80;
        warning = 50;
        critical = 20;
      };
      format = "{icon}";
      format-alt = "{capacity}%";
      format-icons = ["" "" "" "" ""];
      tooltip = false;
    };
    "network" = {
      format-wifi = "{icon}";
      format-alt = "{essid}";
      format-ethernet = "󰈁";
      format-disconnected = "󰤭";
      format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
      tooltip = false;
    };
    "wireplumber" = {
      format = "{icon}";
      format-alt = "{volume}%";
      format-muted = "";
      format-icons = ["" "" ""];
      tooltip = false;
    };
  };
}
