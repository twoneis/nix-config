{ lib, config, ... }: lib.mkIf (config.withNvidia) {
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = false;
    package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
  };
}
