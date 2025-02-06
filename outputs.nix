{ nixpkgs,  home-manager, nixos-hardware, disko, niri, lanzaboote, ... }@inputs: let
  modules = [
      ./options.nix
      ./modules
      niri.nixosModules.niri
      home-manager.nixosModules.home-manager
      lanzaboote.nixosModules.lanzaboote
      disko.nixosModules.disko
  ];
in {
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
        ./devices/inkvine
        nixos-hardware.nixosModules.framework-13-7040-amd
      ] ++ modules;
    };

    ellaca = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./devices/ellaca
      ] ++ modules;
    };
  };
}
