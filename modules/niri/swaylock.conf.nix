{ lib, config, ... }: let
  inherit (lib.strings) concatStrings;
  inherit (config) theme;
in {
  daemonize = true;
  ignore-empty-password = true;
  submit-on-touch = true;

  effect-blur = "30x10";
  screenshots = true;

  clock = true;

  indicator = true;
  indicator-caps-lock = true;
  indicator-radius = 100;
  indicator-thickness = 4;

  inside-color = concatStrings [ theme.overlay "aa" ];
  inside-clear-color = concatStrings [ theme.subtle "aa" ];
  inside-caps-lock-color = concatStrings [ theme.rose "aa" ];
  inside-ver-color = concatStrings [ theme.foam "aa" ];
  inside-wrong-color = concatStrings [ theme.love "aa" ];
  line-uses-inside = true;

  ring-color = theme.surface;
  ring-clear-color = theme.muted;
  ring-caps-lock-color = theme.gold;
  ring-ver-color = theme.pine;
  ring-wrong-color = theme.love;

  separator-color = theme.base;

  key-hl-color = theme.iris;
  bs-hl-color = theme.love;
  caps-lock-key-hl-color = theme.iris;
  caps-lock-bs-hl-color = theme.love;

  layout-bg-color = concatStrings [ theme.overlay "aa" ];
  layout-border-color = concatStrings [ theme.overlay "aa" ];
  layout-text-color = theme.text;

  text-color = theme.text;
  text-clear-color = theme.text;
  text-caps-lock-color = theme.text;
  text-ver-color = theme.text;
  text-wrong-color = theme.text;
}
