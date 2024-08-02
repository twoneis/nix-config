{ lib, ... }: let 
  inherit (lib) mkOption;
  inherit (lib.types) attrsOf str;
in {
  options = {
    disks = mkOption {
      type = attrsOf str;
      default = { };
      example = {
        boot = "4672-C1A9";
        crypt = "747ae319-f189-44f5-9737-a42672e2c02d";
        root = "04255623-c061-4cf0-89fa-b3d8eb239d59";
      };
    };
  };
}
