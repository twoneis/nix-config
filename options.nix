{ lib, ... }: {
  options = with lib; {
    minimal = mkEnableOption "Minimal setup with only cli utilities";
    full = mkEnableOption "Full setup with all programs and themes";

    withAudio = mkEnableOption "Enable support for audio";
    withBluetooth = mkEnableOption "Enable bluetooth";
    withNvidia = mkEnableOption "Enable proprietary nvidia drivers";

    withNiri = mkEnableOption "Enable niri compositor";
    withGnome =mkEnableOption "Enable gnome DE";

    withVM = mkEnableOption "Enable VM related configuration";
    withContainers = mkEnableOption "Enable container support";
    withDistrobox = mkEnableOption "Enable Distrobox";
    withGames = mkEnableOption "Enable games";
  };
}
