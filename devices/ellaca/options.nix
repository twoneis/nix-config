{ ... }: {
  user = true;

  withNiri = true;
  withGnome = false;

  withVM = false;
  withContainers = true;

  withGames = true;

  hwmonPath = "/sys/class/hwmon/hwmon1/temp1_input";
}
