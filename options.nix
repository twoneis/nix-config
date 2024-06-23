{ lib, ... }: {
  options = with lib; {
    full = mkEnableOption "Full home manager configuration with all programs";

    withAudio = mkEnableOption "Enable support for audio";
    withBluetooth = mkEnableOption "Enable bluetooth";

    withNiri = mkEnableOption "Enable niri compositor";
    withGnome = mkEnableOption "Enable Gnome";
    withPlasma = mkEnableOption "Enable KDE Plasma";

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
