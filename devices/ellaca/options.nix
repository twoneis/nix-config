{ ... }: {
  user = true;

  withNiri = true;
  withGnome = false;

  withVM = false;
  withContainers = true;

  withGames = false;

  hwmonPath = "/sys/class/hwmon/hwmon1/temp1_input";
}
