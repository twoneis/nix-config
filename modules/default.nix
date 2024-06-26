{ inputs, pkgs, lib, ... }: {
  imports = [
    ./audio
    ./bluetooth
    ./containers
    ./games
    ./gnome
    ./home
    ./niri
    ./plasma
    ./virt
  ];

  nixpkgs = {
    overlays = [
      inputs.nur.overlay
    ];
    config = {
      allowUnfree = true;
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  documentation.nixos.enable = false;

  networking = {
    useDHCP = lib.mkDefault true;
    wireless.iwd.enable = true;
    extraHosts = 
    ''
      10.10.11.245 surveillance.htb
    '';
    # 57621: spotifyd
    firewall.allowedTCPPorts = [
      57621
    ];
  };

  time.timeZone = "Europe/Amsterdam";
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  fonts = {
    packages = with pkgs; [
      alegreya
      alegreya-sans
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
      roboto
      ubuntu_font_family
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Alegreya" ];
        sansSerif = [ "Alegreya Sans" ];
        monospace = [ "Fira Code Nerd Font" ];
      };
    };
  };

  users.users.twoneis = {
    isNormalUser = true;
    description = "twoneis";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  services = {
    # Needed for some features in nautilus such as auto-mounting and trash
    gvfs.enable = true;

    xserver.displayManager.gdm = {
      enable = true;
    };
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
