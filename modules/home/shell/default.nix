{ ... }: {
  home.shellAliases = {
    ga = "git add -A";
    gc = "git commit -m ";
    gca = "git add -A && git commit -am ";
    gp = "git push";
    gpl = "git pull --recurse-submodules";

    nrb = "sudo nixos-rebuild switch --flake .";
    nd = "nix develop";
  };

  programs.bash = {
    enable = true;
  };
}
