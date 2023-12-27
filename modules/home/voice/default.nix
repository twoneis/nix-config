{ pkgs, ... }: {
  home.packages = with pkgs; [
    talon
  ];
}
