{ pkgs, ... }: {
  home.packages = with pkgs; [
    man-pages
    man-pages-posix
    tree
    file
    zip
    unzip
    gnutar
    thefuck
    halp
    lshw
  ];

  home.file = {
    ".gdbinit" = {
      source = ./gdbinit;
    };
  };

  programs.man = {
    enable = true;
  };

  programs.less = {
    enable = true;
    keys = ''
      t back-line
      n forw-line
    '';
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
    gc = "git commit";
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

  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      { name = "tide"; src = pure.src; }
    ];
    functions = {
      start = "
        niri-session
      ";
    };
  };
}
