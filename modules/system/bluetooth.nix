{ pkgs, ... }: {
  services.blueman.enable = true;
  environment.systemPackages = with pkgs; [
    blueman
  ];
}
