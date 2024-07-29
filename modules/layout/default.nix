{ ... }: {
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
