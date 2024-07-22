{ nixpkgs, lix, home-manager, niri, impermanence, lanzaboote, ... }@inputs: let
  modules = [
    ./modules
    ./options.nix
    ./colors.nix
    niri.nixosModules.niri
    home-manager.nixosModules.home-manager
    lix.nixosModules.default
    impermanence.nixosModules.impermanence
    lanzaboote.nixosModules.lanzaboote
  ];
in {
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
      ] ++ modules;
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
      ] ++ modules;
    };

    # Framework Laptop 13
    # AMD Ryzen 5 7640U
    # AMD Radeon 760M
    # 16GB RAM
    inkvine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/inkvine
      ] ++ modules;
    };

    # VM for luks-on-sleep

  };
}
