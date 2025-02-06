{ lib, ... }: let
  inherit (lib) mkOption mkEnableOption;
  inherit (lib.types) nullOr attrsOf str;
in {
  options = {
    conf = {
      ssh.enable = mkEnableOption "Install my public key to allow accessing this machine via ssh.";
      apps.enable = mkEnableOption "Enable complete configuration for end-user machine.";
      niri.enable = mkEnableOption "Enable niri compositor.";
      vm.enable = mkEnableOption "Enable VM related configuration.";
      containers.enable = mkEnableOption "Enable container support.";
      games.enable = mkEnableOption "Enable games.";
      secureboot.enable = mkEnableOption "Enable secure boot utilities (manual key-enrolling required).";
      extraLayout.enable = mkEnableOption "Enable additional custom layout.";
      fonts.enable = mkEnableOption "Install and set preferred fonts";
      networkmanager.enable = mkEnableOption "Enable network manager and some related configuration";

      username = mkOption {
        type = str;
        description = "Username of the default user (single user setup).";
        default = "twoneis";
        example = "anna";
      };

      stateVersion = mkOption {
        type = nullOr str;
        description = "Nixos state version. Set to newest on first install and then don't change.";
        default = null;
        example = "24.05";
      };

      hmStateVersion = mkOption {
        type = nullOr str;
        description = "Home-Manager state version. Set to newest on first install and then don't change.";
        default = null;
        example = "24.11";
      };

      keys = mkOption {
        type = attrsOf str;
        description =- "Default key binds.";
        default = {
          up = "t";
          down = "n";
          left = "h";
          right = "s";
        };
      };
    };

    device = {
      disks = mkOption {
        type = attrsOf str;
        description = "A set of UUIDs of the partitions/lvms/... that can be used easily reused in the config. In this config boot and root are assumed to be always present.";
        default = { };
        example = {
          boot = "4672-C1A9";
          crypt = "747ae319-f189-44f5-9737-a42672e2c02d";
          root = "04255623-c061-4cf0-89fa-b3d8eb239d59";
        };
      };
    };

    theme = mkOption {
      type = attrsOf str;
      description = "Colors to be used for theming, the names and colors are from the rose-pine theme.";
      default = {
        base = "#191724";
        surface = "#1f1d2e";
        overlay = "#26233a";
        muted = "#6e6a86";
        subtle = "#908caa";
        text = "#e0def4";
        love = "#eb6f92";
        gold = "#f6c177";
        rose = "#ebbcba";
        pine = "#31748f";
        foam = "#9ccfd8";
        iris = "#c4a7e7";
        highlight-low = "#21202e";
        highlight-med = "#403d52";
        highlight-high = "#524f67";
      };
      example = {
        base = "#191724";
        surface = "#1f1d2e";
        overlay = "#26233a";
        muted = "#6e6a86";
        subtle = "#908caa";
        text = "#e0def4";
        love = "#eb6f92";
        gold = "#f6c177";
        rose = "#ebbcba";
        pine = "#31748f";
        foam = "#9ccfd8";
        iris = "#c4a7e7";
        highlight-low = "#21202e";
        highlight-med = "#403d52";
        highlight-high = "#524f67";
      };
    };
  };
}
