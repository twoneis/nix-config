{ lib, ... }: {
  options = {
    withNiri = with lib; mkEnableOption "Enable niri compositor";
    withGnome = with lib; mkEnableOption "Enable gnome DE";
    withNvidia = with lib; mkEnableOption "Enable proprietary nvidia drivers";
    withVM = with lib; mkEnableOption "Enable VM related configuration";
    withDistrobox = with lib; mkEnableOption "Enable Distrobox";
    withGames = with lib; mkEnableOption "Enable games";
  };
}
