# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, lib, config, ... }: {
  options = {
    withNiri = with lib; mkEnableOption "Enable niri";
    withGnome = with lib; mkEnableOption "Enable gnome";
    withVM = with lib; mkEnableOption "Enable VM related configuration";
  };

  imports = [
    ./audio.nix
    ./containers.nix
    ./fonts.nix
    ./gnome
    ./niri
    ./virt.nix
  ];

  config = {
    # Allow packages from nixpkgs
    nixpkgs.config = {
      allowUnfree = true;
    };

    #Optimise nix store
    nix = {
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
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
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
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

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Remove XTerm
    services.xserver.excludePackages = [ pkgs.xterm ];

    # Configure keymap in X11
    services.xserver = {
      layout = "us";
      xkbVariant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = false;

    # Security
    security.rtkit.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.twoneis = {
      isNormalUser = true;
      description = "twoneis";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
