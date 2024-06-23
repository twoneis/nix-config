{ ... }: {
  full = true;

  withAudio = true;
  withBluetooth = true;

  withNiri = true;
  withGnome = true;

  withVM = false;
  withContainers = true;
  withGames = true;

  hwmonPath = "/sys/class/hwmon/hwmon1/temp1_input";
}
