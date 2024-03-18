{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../shared/configuration.nix
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "caleb" = import ./home.nix;
    };
    useGlobalPkgs = true;
  };
}
