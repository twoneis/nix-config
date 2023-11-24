{ pkgs, ... }: 
let
  themes = {
    rosepine = builtins.fromTOML "${builtins.readFile ./rose_pine_dawn.toml}";
  };
in {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [ nil marksman ];
    settings = import ./helix-config.nix;
    themes = themes;
  };
}
