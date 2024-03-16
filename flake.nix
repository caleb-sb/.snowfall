{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };

    blender-bin.url = "github:edolstra/nix-warez?dir=blender";
  };

  outputs = { self, nixpkgs, blender-bin, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        work = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./work/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ({config, pkgs, ...}: {
              nixpkgs.overlays = [ blender-bin.overlays.default ];
            })
            ./desktop/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
    };
  };
}
