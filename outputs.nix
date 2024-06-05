{ nixpkgs, home-manager, niri, ... }@inputs: {
  nixosConfigurations = {
    # AMD Ryzen 5600X
    # Nvidia GeForce GTX 1060 (6GB)
    # 32GB RAM
    ellaca = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/ellaca
        ./modules
        ./options.nix
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
      ];
    };

    # Zotac ZBOX-CI327NANO
    # Intel Celeron N3450
    # Intel HD Graphics 500
    # 8GB RAM
    pleniscenta = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/pleniscenta
        ./modules
        ./options.nix
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
