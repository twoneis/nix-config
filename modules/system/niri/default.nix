{ lib, config, ... }: lib.mkIf (config.withNiri) {
  programs.niri.enable = true;
}
