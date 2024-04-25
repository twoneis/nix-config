# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./containers.nix
    ./distrobox.nix
    ./fonts.nix
    ./games.nix
    ./gnome
    ./niri
    ./virt.nix
  ];

  # Needed for some nautilus features like auto-mount and trash
  services.gvfs.enable = true;

  # 57621: spotifyd
  networking.firewall.allowedTCPPorts = [ 57621 ];

  # Auto-mount new devices
  # services.udev.extraRules = ''
  #    ACTION=="add", SUBSYSTEMS=="usb", SUBSYSTEM=="block", ENV{ID_FS_USAGE}=="filesystem", RUN{program}+="${pkgs.systemd}/bin/systemd-mount --no-block --automount=yes --collect $devnode /media"
  # '';

  environment.systemPackages = with pkgs; [ sddm-chili-theme ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    wayland.compositor = "kwin";
    theme = "chili";
  };

  # Wayland in electron
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  networking.extraHosts = 
  ''
    10.10.11.245 surveillance.htb
  '';

  nix.nixPath = ["nixpgks=${inputs.nixpkgs}"];

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

  # Configure xserver
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
  };

  # Configure xkb
  services.xserver.xkb = {
    layout = "us";
    variant = "";
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

  # Use zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Allow swaylock to PAM authentication
  security.pam.services.swaylock = {};
}
