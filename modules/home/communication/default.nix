{ pkgs, ... }: {
  home.packages = with pkgs; [
    signal-desktop
    fractal
  ];

  programs.thunderbird = {
    enable = true;
    profiles = {
      "default" = {
        isDefault = true;
      };
    };
  };
}
