{ lib, config, ... }: lib.mkIf(config.withBluetooth) {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
}
