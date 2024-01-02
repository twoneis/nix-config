{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:nixos/nixos-hardware";
    };

    nur = {
      url = "github:nix-community/nur";
    };
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, nur, ... }:
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/system
          ./devices/desktop

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

      surface = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/system
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
