{ pkgs, ... }: {
  home.packages = with pkgs; [
    thefuck
    git
  ];

  home.shellAliases = {
    ga = "git add";
    gc = "git commit -m ";
    gca = "git add -A && git commit -am ";
    gs = "git stash";
    gsp = "git stash pop";
    gp = "git push";
    gpl = "git pull --recurse-submodules";
    gst = "git status";

    nrb = "sudo nixos-rebuild switch --flake . --cores 0";
    nd = "nix develop";

    neofetch = "hyfetch";
  };

  programs.bash = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableVteIntegration = true;
    history.ignoreAllDups = true;
    historySubstringSearch.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "bira";
    };
  };
}
