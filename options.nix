{ lib, ... }: let
  inherit (lib) mkOption mkEnableOption;
  inherit (lib.types) nullOr str;
in {
  options = {
    conf = {
      apps.enable = mkEnableOption "Enable complete configuration for end-user machine";
      niri.enable = mkEnableOption "Enable niri compositor";
      vm.enable = lib.mkEnableOption "Enable VM related configuration";
      containers.enable = mkEnableOption "Enable container support";
      games.enable = mkEnableOption "Enable games";
      impermanence.enable = mkEnableOption "Use impermanence module";
      secureboot.enable = mkEnableOption "Enable secure boot utilities (manual key-enrolling required)";

      username = mkOption {
        type = str;
        default = "twoneis";
        example = "anna";
      };

      hwmonPath = mkOption {
        type = nullOr str;
        default = null;
        example = "/sys/class/hwmon/hwmon1/temp1_input";
      };

      stateVersion = mkOption {
        type = nullOr str;
        default = null;
        example = "24.05";
      };

      hmStateVersion = mkOption {
        type = nullOr str;
        default = null;
        example = "24.11";
      };
    };
  };
}
