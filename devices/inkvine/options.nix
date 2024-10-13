{ ... }: {
  conf = {
    apps.enable = true;
    niri.enable = true;
    games.enable = false;
    extraLayout.enable = true;
    vm.enable = false;

    stateVersion = "24.05";
    hmStateVersion = "24.11";
  };
}
