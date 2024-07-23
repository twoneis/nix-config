{ inputs, lib, config, ... }: let
  inherit (lib) mkIf;
in{
  nixpkgs = {
    overlays = mkIf config.withNiri [
      inputs.niri.overlays.niri
    ];

    config = {
      allowUnfree = true;
    };
  };
}
