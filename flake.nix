{
  description = "Nix flake for my system configuration with nix and home-manager";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
