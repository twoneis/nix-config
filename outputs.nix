{ nixpkgs, home-manager, nixos-hardware, nur, niri, stylix, ... }: {
  nixosConfigurations = let

    clientModules = [
        ./modules/system
        ./options.nix
        niri.nixosModules.niri
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager {
          nixpkgs.overlays = [
            nur.overlay
          ];
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.twoneis = import ./modules/system/home;
          };
        }
    ];

    serverModules = [
      ./modules/server
      ./options.nix
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.twoneis = import ./modules/server/home;
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
        nixos-hardware.nixosModules.microsoft-surface-pro-intel
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
