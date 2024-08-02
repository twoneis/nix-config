{ ... }: {
  conf = {
    apps.enable = true;
    niri.enable = true;
    containers.enable = true;

    hwmonPath = "/sys/class/hwmon/hwmon1/temp1_input";
    stateVersion = "24.05";
    hmStateVersion = "24.11";
  };
}
