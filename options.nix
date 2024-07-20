{ lib, ... }: {
  options = with lib; {
    user = mkEnableOption "Enable complete configuration for end-user machine";

    withNiri = mkEnableOption "Enable niri compositor";
    withGnome = mkEnableOption "Enable Gnome";

    withVM = mkEnableOption "Enable VM related configuration";
    withContainers = mkEnableOption "Enable container support";

    withGames = mkEnableOption "Enable games";

    username = mkOption {
      type = types.str;
      default = "twoneis";
      example = "anna";
    };

    hwmonPath = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "/sys/class/hwmon/hwmon1/temp1_input";
    };

    stateVersion = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "24.05";
    };

    hmStateVersion = mkOption {
      type = types.nullOr types.str;
      default = null;
      example = "24.11";
    };
  };
}
