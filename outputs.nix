{ nixpkgs, home-manager, nixos-hardware, nur, niri, ... }@inputs: {
  nixosConfigurations = let
    clientModules = [
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
    serverModules = [
      ./modules/server
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          user.twoneis = import ./modules/server-home;
        };
      }
    ];
  in {
    desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./devices/desktop
      ] ++ clientModules;
    };

    surface = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./devices/surface
      ] ++ clientModules;
    };

    zotac-mini = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./devices/zotac-mini
      ] ++ serverModules;
    };
  };
}
