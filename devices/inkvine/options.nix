{ ... }: {
  full = true;

  withAudio = true;
  withBluetooth = true;

  withNiri = true;
  withGnome = false;
  withPlasma = true;

  withVM = false;
  withContainers = false;
  withGames = true;

  hwmonPath = "/sys/class/hwmon/hwmon4/temp1_input";
}
