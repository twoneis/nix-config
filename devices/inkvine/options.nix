{ ... }: {
  user = true;

  withNiri = true;
  withGnome = false;

  withVM = false;
  withContainers = false;

  withGames = false;

  hwmonPath = "/sys/class/hwmon/hwmon4/temp1_input";
}
