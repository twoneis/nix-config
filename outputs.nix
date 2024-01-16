{ nixpkgs, home-manager, nixos-hardware, nur, niri, ... }@inputs: {
  nixosConfigurations = let
    commonModules = [
        ./modules/system
        niri.nixosModules.default
        home-manager.nixosModules.home-manager {
          nixpkgs.overlays = [
            nur.overlay
          ];
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.twoneis = import ./modules/home;
          };
        }
    ];
  in {
    desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./devices/desktop
      ] ++ commonModules;
    };

    surface = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./devices/surface
        nixos-hardware.nixosModules.microsoft-surface-pro-intel
      ] ++ commonModules;
    };
  };
}
