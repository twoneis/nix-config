{ pkgs, ... }: {
  imports = [
    # ./access-point.nix
  ];

  # Allow ssh access
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication =  true;
      KbdInteractiveAuthentication = true;
    };
  };

  # Allow packages from nixpkgs
  nixpkgs.config = {
    allowUnfree = true;
  };

  #Optimise nix store
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings.auto-optimise-store = true;
  };

  # Enable nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Disable documentation
  documentation.nixos.enable = false;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Security
  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.twoneis = {
    isNormalUser = true;
    description = "twoneis";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Use zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
