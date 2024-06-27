{ ... }: {
  full = true;

  withAudio = true;
  withBluetooth = true;

  withNiri = true;
  withGnome = false;
  withPlasma = false;

  withVM = false;
  withContainers = false;
  withGames = false;

  hwmonPath = "/sys/class/hwmon/hwmon4/temp1_input";
}
