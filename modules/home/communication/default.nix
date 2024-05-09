{ pkgs, ... }: {
  home.packages = with pkgs; [
    signal-desktop
    vesktop
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
