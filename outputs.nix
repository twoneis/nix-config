{ nixpkgs, home-manager, niri, ... }@inputs: {
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
        ./modules
        ./options.nix
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
      ];
    };

    # Zotac Mini
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
