{ nixpkgs, home-manager, nixos-hardware, niri, ... }@inputs: {
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

    # Surface Pro 7 (i5 128GB)
    akarso = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/akarso
        ./modules
        ./options.nix
        nixos-hardware.nixosModules.microsoft-surface-pro-intel
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
