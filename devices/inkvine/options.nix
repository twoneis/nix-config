{ ... }: {
  conf = {
    apps.enable = true;
    niri.enable = true;
    games.enable = true;
    secureboot.enable = true;

    hwmonPath = "/sys/class/hwmon/hwmon1/temp1_input";
    stateVersion = "24.05";
    hmStateVersion = "24.11";
  };
}
