{ nixpkgs, home-manager, nixos-hardware, nur, niri, impermanence, ... }@inputs: {
  nixosConfigurations = {
    # AMD Ryzen 5600X
    # nvidia GeForce GTX 1060 (6GB)
    ellaca = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/ellaca
        ./modules/system
        ./modules/system/persist
        ./options.nix
        niri.nixosModules.niri
        impermanence.nixosModules.impermanence
        home-manager.nixosModules.home-manager {
          nixpkgs.overlays = [ nur.overlay ];
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.twoneis = import ./modules/system/home;
          };
        }
      ];
    };

    # Surface Pro 7 (i5 128GB)
    akarso = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/akarso
        ./modules/system
        ./options.nix
        nixos-hardware.nixosModules.microsoft-surface-pro-intel
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager {
          nixpkgs.overlays = [ nur.overlay ];
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.twoneis = import ./modules/system/home;
          };
        }
      ];
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
    };
  };
}
