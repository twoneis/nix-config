{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config.conf) extraLayout;
in mkIf extraLayout.enable {
  services.xserver.xkb = {
    layout = "us,custom";
    options = "compose:ralt";

    extraLayouts."custom" = {
      description = "custom dvorak-like layout.";
      languages = [ "en" ];
      symbolsFile = ./custom.xkb;
    };
 };

  console.keyMap = "us";
}
