{ lib, ... }: {
  options = let 
    inherit (lib) mkOption mkEnableOption;
    inherit (lib.types) nullOr attrsOf str;
  in {
    full = mkEnableOption "Enable complete configuration for end-user machine";

    withNiri = mkEnableOption "Enable niri compositor";

    withVM = lib.mkEnableOption "Enable VM related configuration";
    withContainers = mkEnableOption "Enable container support";

    withGames = mkEnableOption "Enable games";

    withImpermanence = mkEnableOption "Use impermanence module";

    withSecureBoot = mkEnableOption "Enable secure boot utilities (manual key-enrolling required)";

    disks = mkOption {
      type = attrsOf str;
      default = { };
      example = {
        boot = "4672-C1A9";
        crypt = "747ae319-f189-44f5-9737-a42672e2c02d";
        root = "04255623-c061-4cf0-89fa-b3d8eb239d59";
      };
    };

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
}
