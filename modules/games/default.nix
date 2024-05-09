{ lib, config, pkgs, ... }: lib.mkIf (config.withGames) {
  environment.systemPackages = with pkgs; [
    prismlauncher
  ];

  programs.steam = {
    enable = true;
  };
}
