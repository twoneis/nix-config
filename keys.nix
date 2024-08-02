{ lib, ... }: let
  inherit (lib) mkOption;
  inherit (lib.types) attrsOf str;
in{
  options = {
    keys = mkOption {
      type = attrsOf str;
      default = {
        up = "t";
        down = "n";
        left = "h";
        right = "s";
      };
    };
  };
}
