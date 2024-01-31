{ pkgs, ... }: {
  home.packages = with pkgs; [
    thefuck
    git
  ];

  home.shellAliases = {
    ga = "git add -A";
    gc = "git commit -m ";
    gca = "git add -A && git commit -am ";
    gp = "git push";
    gpl = "git pull --recurse-submodules";

    nrb = "sudo nixos-rebuild switch --flake .";
    nd = "nix develop";

    neofetch = "hyfetch";
  };

  programs.bash = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
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
