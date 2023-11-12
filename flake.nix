{
  description = "Nix flake for my system configuration with nix and home-manager";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    x86 = "x86_64-linux";
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit x86; };

        modules = [
          ./devices/desktop

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.twoneis = import ./home;
            };
          }
        ];
      };

      surface = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit x86; };

        modules = [
          ./devices/surface

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.twoneis = import ./home;
            };
          }
        ];
      };
    };
  };
}
