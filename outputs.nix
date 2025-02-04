{ nixpkgs,  home-manager, nixos-hardware, disko, niri, lanzaboote, nixos-facter-modules, ... }@inputs: {
  nixosConfigurations = {
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
        ./options.nix
        ./devices/inkvine
        ./modules
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
        lanzaboote.nixosModules.lanzaboote
        nixos-hardware.nixosModules.framework-13-7040-amd
      ];
    };

    ellaca = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./options.nix
        ./devices/ellaca
        ./modules/server
        disko.nixosModules.disko
      ];
    };
  };
}
