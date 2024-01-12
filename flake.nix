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

    niri-src = {
      url = "github:yalter/niri";
      flake = false;
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.niri-src.follows = "niri-src";
    };
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, nur, niri, ... }: {
    nixosConfigurations = let
      commonModules = [
          ./modules/system

          niri.nixosModules.default

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
    in {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./devices/desktop
        ] ++ commonModules;
      };

      surface = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./devices/surface
          nixos-hardware.nixosModules.microsoft-surface-pro-intel
        ] ++ commonModules;
      };
    };
  };
}
