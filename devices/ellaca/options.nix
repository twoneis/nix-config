{ ... }: {
  full = true;

  withAudio = true;
  withBluetooth = true;

  withNiri = true;
  withGnome = false;
  withPlasma = true;

  withVM = false;
  withContainers = true;
  withGames = false;

  hwmonPath = "/sys/class/hwmon/hwmon1/temp1_input";
}
