{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [ nil marksman ];
    settings = import ./helix-config.nix;
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhsWithPackages (pkgs: with pkgs; [talon]);
  };
}
