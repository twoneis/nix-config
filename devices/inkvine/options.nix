{ ... }: {
  conf = {
    apps.enable = false;
    niri.enable = false;
    games.enable = false;
    extraLayout.enable = true;
    vm.enable = false;

    stateVersion = "24.05";
    hmStateVersion = "24.11";
  };
}
