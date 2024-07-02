{ lib, ... }: {
  options = with lib; {
    user = mkEnableOption "Enable complete configuration for end-user machine";

    withNiri = mkEnableOption "Enable niri compositor";
    withGnome = mkEnableOption "Enable Gnome";

    withVM = mkEnableOption "Enable VM related configuration";
    withContainers = mkEnableOption "Enable container support";

    withGames = mkEnableOption "Enable games";

    hwmonPath = mkOption {
      type = with types; nullOr str;
      default = null;
      example = "/sys/class/hwmon/hwmon1/temp1_input";
    };
  };
}
