{ nixpkgs, lix, home-manager, niri, impermanence, ... }@inputs: {
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
        ./colors.nix
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
        lix.nixosModules.default
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
        ./colors.nix
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
        lix.nixosModules.default
      ];
    };

    # Lenovo Thinkpad T540p
    # Intel i7-4710MQ
    # 8GB RAM
    inkvine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/inkvine
        ./modules
        ./options.nix
        ./colors.nix
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
        lix.nixosModules.default
      ];
    };

    # Framework Laptop 13
    # AMD Ryzen 5 7640U
    # AMD Radeon 760M
    # 16GB RAM
    tunyon = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/tunyon
        ./modules
        ./options.nix
        ./colors.nix
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
        lix.nixosModules.default
        impermanence.nixosModules.impermanence
      ];
    };
  };
}
