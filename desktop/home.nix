{ config, pkgs, lib, ... }:

{
  imports = [
    ../shared/home.nix
  ];

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 1;
  };

  home.packages = with pkgs; [
    blender
    steam
    discord
    gparted
  ];
}

