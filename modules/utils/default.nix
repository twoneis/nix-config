{ pkgs, ... }: {
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  home-manager.users.twoneis = {
    home.packages = with pkgs; [
      man-pages
      man-pages-posix
      tree
      file
      zip
      unzip
      gnutar
      lshw
      netcat-openbsd
    ];

    home.file = {
      ".gdbinit" = {
        source = ./gdbinit.conf;
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
      settings = import ./helix.conf.nix;
      languages = import ./helix-languages.conf.nix;
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
      settings = import ./hyfetch.conf.nix { };
    };

    programs.fish = {
      enable = true;
      plugins = with pkgs.fishPlugins; [
        { name = "tide"; src = pure.src; }
        { name = "bass"; src = bass.src; }
      ];
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
  };
}
