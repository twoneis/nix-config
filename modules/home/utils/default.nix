{ pkgs, ... }: {
  home.packages = with pkgs; [
    man-pages
    man-pages-posix
    tree
    zip
    unzip
    thefuck
  ];

  home.file = {
    ".gdbinit" = {
      source = ./gdbinit;
    };
  };

  programs.man = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "twoneis";
    userEmail = "sanjay29@sapura.de";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [ nil marksman ];
    settings = import ./helix-config.nix;
    languages = import ./helix-languages.nix;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.bottom = {
    enable = true;
  };

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "transgender";
      mode = "rgb";
      light_dark = "dark";
      lightness = 0.65;
      color_align = {
          mode = "horizontal";
          custom_colors = [];
          fore_back = null;
      };
      backend = "neofetch";
      args = null;
      distro = "nixos_old";
      pride_month_shown = [];
      pride_month_disable = false;
    };
  };

  home.shellAliases = {
    ga = "git add";
    gc = "git commit -m ";
    gca = "git add -A && git commit -am ";
    gs = "git stash";
    gsp = "git stash pop";
    gp = "git push";
    gpl = "git pull --recurse-submodules";
    gst = "git status";

    repl = "nix repl --expr 'import <nixpkgs>{}'";

    nrb = "sudo nixos-rebuild switch --flake . --cores 0";
    nd = "nix develop";

    neofetch = "hyfetch";
  };

  # For direnv and shell aliases the shell needs to be managed by hm
  programs.bash.enable = true;

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
