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

  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "transgender";
      mode = "rgb";
      light_dark = "dark";
      lightness = 0.65;
      color_align = {
          mode = "horizontal";
      };
      backend = "neofetch";
      distro = "nixos_old";
    };
  };

  programs.fish = {
    enable = true;
    plugins = with pkgs.fishPlugins; [
      { name = "tide"; src = pure.src; }
      { name = "bass"; src = bass.src; }
      { name = "sponge"; src = sponge.src; }
    ];
    functions = {
      start = "
        niri-session
      ";
      gnome-init = "
        gnome-randr modify DP-1 -m 5120x2160@59.940
      ";
      start-gnome = "
        gnome-shell --wayland
      ";
    };
    shellAbbrs = {
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gs = "git submodule sync --recursive && git submodule update --init --recursive";
      gpl = "git pull --recurse-submodules";
      gst = "git status";

      repl = "nix repl --expr 'import <nixpkgs>{}'";

      nrb = "sudo nixos-rebuild switch --cores 0 --flake .";
      nd = "nix develop";
    };
  };
}
