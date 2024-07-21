{ inputs, pkgs, lib, config, ... }: {
  imports = [
    ./containers
    ./games
    ./gnome
    ./home
    ./niri
    ./user
    ./utils
    ./vm
  ];


    nixpkgs.config.allowUnfree = true;

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

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };

  users.users.${config.username}= {
    isNormalUser = true;
    description = config.username;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = config.stateVersion;
}
