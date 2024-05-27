{ lib, ... }: {
  options = with lib; {
    minimal = mkEnableOption "Minimal setup with only cli utilities";

   withAudio = mkEnableOption "Enable support for audio";
    withBluetooth = mkEnableOption "Enable bluetooth";
    withNvidia = mkEnableOption "Enable proprietary nvidia drivers";

    withNiri = mkEnableOption "Enable niri compositor";
    withGnome =mkEnableOption "Enable gnome DE";

    withVM = mkEnableOption "Enable VM related configuration";
    withContainers = mkEnableOption "Enable container support";
    withGames = mkEnableOption "Enable games";
  };
}
