{ ... }: {
  conf = {
    apps.enable = true;
    niri.enable = true;
    extraLayout.enable = true;
    vm.enable = true;
    secureboot.enable = true;

    stateVersion = "24.05";
    hmStateVersion = "24.11";
  };
}
