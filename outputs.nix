{ nixpkgs, home-manager, nixos-hardware, nur, niri, ... }@inputs: {
  nixosConfigurations = let

    clientModules = [
        ./modules/system
        ./options.nix
        niri.nixosModules.niri
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
    # AMD Ryzen 5600X
    # nvidia GeForce GTX 1060 (6GB)
    ellaca = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/ellaca
        ] ++ clientModules;
    };

    # Surface Pro 7 (i5 128GB)
    akarso = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/akarso
        nixos-hardware.nixosModules.microsoft-surface-pro-intel
      ] ++ clientModules;
    };

    # Zotac Mini
    # (Name should be used for an ARM device instead once i get one)
    creosote = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/creosote
      ] ++ serverModules;
    };
  };
}
