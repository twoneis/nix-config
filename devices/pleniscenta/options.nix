{ ... }: {
  full = true;

  withAudio = true;
  withBluetooth = true;

  withNiri = true;
  withGnome = false;

  withVM = false;
  withContainers = false;
  withGames = false;

  hwmonPath = "/sys/class/hwmon/hwmon1/temp1_input";
}
