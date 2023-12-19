{
  description = "Nix flake for my system configuration with nix and home-manager";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:nixos/nixos-hardware/master";
    };

    nur = {
      url = "github:nix-community/nur";
    };

    niri = {
      url = "github:twoneis/niri/nixify";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, nur, niri, ... }:
  let
    x86 = "x86_64-linux";
    common = ./modules/system;
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit x86;
        };

        modules = [
          common
          ./devices/desktop

          home-manager.nixosModules.home-manager {
            nixpkgs.overlays = [
              niri.overlay
              nur.overlay
            ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.twoneis = import ./modules/home;
            };
          }
        ];
      };

      surface = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit x86;
        };

        modules = [
          common
          ./devices/surface
          nixos-hardware.nixosModules.microsoft-surface-pro-intel

          home-manager.nixosModules.home-manager {
            nixpkgs.overlays = [
              nur.overlay
            ];
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.twoneis = import ./modules/home;
            };
          }
        ];
      };
    };
  };
}
